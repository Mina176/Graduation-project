import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduation_project/screens/files_screen.dart';
import 'package:graduation_project/screens/settings_screen.dart';
import 'package:graduation_project/services/tcp/poke.dart';
import 'package:graduation_project/services/tcp/poke_listener.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:graduation_project/services/storage_helper/storage_helper.dart';

part 'udp_discovery.g.dart';
part 'udp_discovery.mapper.dart';

// The port to listen on for UDP data
const int udpPort = 4444;

/// Provider that creates and binds a UDP socket on the specified port
@riverpod
Future<RawDatagramSocket> udpSocket(Ref ref) async {
  final socket = await RawDatagramSocket.bind(
    InternetAddress.anyIPv4,
    udpPort,
  );

  // Close the socket when the provider is disposed
  ref.onDispose(() {
    socket.close();
  });

  return socket;
}

/// Stream provider that continuously reads UDP data from the socket
@riverpod
Stream<Datagram> udpDataStream(Ref ref) async* {
  final socket = await ref.watch(udpSocketProvider.future);
  await for (final event in socket) {
    if (event == RawSocketEvent.read) {
      final datagram = socket.receive();
      final senderIpAddress = datagram?.address.address;
      final localIpAddress = await getCurrentIpAddress();
      // if (senderIpAddress == localIpAddress) continue;
      if (datagram != null && datagram.data.isNotEmpty) {
        yield datagram;
      }
    }
  }
}

//get current ip address
Future<String?> getCurrentIpAddress() {
  return NetworkInfo().getWifiIP();
}

@MappableClass()
class UserStreamState with UserStreamStateMappable {
  final Set<UserModelWrapper> users;
  final DateTime lastUpdated;
  UserStreamState({required this.users, required this.lastUpdated});
}

@riverpod
class UserStream extends _$UserStream {
  @override
  UserStreamState build() {
    ref.listen(udpDataStreamProvider, (previous, next) async {
      final datagram = next.value;
      if (datagram == null) return;
      final senderIpAddress = datagram.address.address;
      final data = datagram.data;
      final message = utf8.decode(data);
      final messageObject = UdpMessageMapper.fromJson(message);
      if (messageObject is UdpDiscoveryMessage) {
        final user = messageObject.user;
        final storage = messageObject.availableStorage;
        final timestamp = DateTime.now();
        final userWrapper = UserModelWrapper(
          ipAddress: senderIpAddress,
          user: user,
          timestamp: timestamp,
          availableStorage: storage,
        );
        final newUsers = state.users;
        if (newUsers.contains(userWrapper)) {
          newUsers.remove(userWrapper);
        }
        newUsers.add(userWrapper);
        state = state.copyWith(
          users: newUsers,
          lastUpdated: timestamp,
        );
      }
    });
    return UserStreamState(users: {}, lastUpdated: DateTime.now());
  }
}

@MappableClass()
class UserModelWrapper with UserModelWrapperMappable {
  final String ipAddress;
  final UserModel user;
  final DateTime timestamp;
  final int availableStorage;

  const UserModelWrapper(
      {required this.ipAddress,
      required this.user,
      required this.timestamp,
      required this.availableStorage});

  @override
  bool operator ==(Object other) {
    if (other is UserModelWrapper) {
      return ipAddress == other.ipAddress;
    }
    return false;
  }

  @override
  int get hashCode => ipAddress.hashCode;
}

@MappableClass()
class UserModel with UserModelMappable {
  final String name;
  const UserModel({required this.name});
}

@MappableClass(discriminatorKey: 'type')
sealed class UdpMessage with UdpMessageMappable {
  const UdpMessage({required this.type});
  final String type;
}

@MappableClass(discriminatorValue: 'discovery')
class UdpDiscoveryMessage extends UdpMessage with UdpDiscoveryMessageMappable {
  final UserModel user;
  final int availableStorage;
  const UdpDiscoveryMessage({
    required this.availableStorage,
    required this.user,
    super.type = 'discovery',
  });
}

@MappableClass(discriminatorValue: 'file')
class UdpFileMessage extends UdpMessage with UdpFileMessageMappable {
  final List<String> fileIds;
  const UdpFileMessage({
    required this.fileIds,
    super.type = 'file',
  });
}

@MappableClass(discriminatorValue: 'uploadfile')
class UdpUploadMessage extends UdpMessage with UdpUploadMessageMappable {
  final List<String> fileIds;
  final int fileSize;
  final TcpMessage message;
  UdpUploadMessage({
    required this.fileIds,
    required this.message,
    required this.fileSize,
    super.type = 'uploadfile',
  });
}

@riverpod
class UserSettings extends _$UserSettings {
  @override
  UserSettingsModel build() {
    final initialStorage = StorageHelper().loadAvailableStorageInBytes();
    return UserSettingsModel(offeredStorageMB: initialStorage);
  }

  void updateOfferedStorageMB(int value) {
    state = state.copyWith(offeredStorageMB: value);
  }
}

class UserSettingsModel {
  final int offeredStorageMB;

  const UserSettingsModel({required this.offeredStorageMB});

  UserSettingsModel copyWith({
    int? offeredStorageMB,
  }) =>
      UserSettingsModel(
          offeredStorageMB: offeredStorageMB ?? this.offeredStorageMB);
}

/// Provider that sends hello messages via UDP every second
@riverpod
class UdpHelloSender extends _$UdpHelloSender {
  Timer? _timer;

  @override
  void build() {
    final availableStorage = ref.watch(userSettingsProvider).offeredStorageMB;
    _startSending(availableStorage);

    // Clean up timer when provider is disposed
    ref.onDispose(() {
      _timer?.cancel();
      _timer = null;
    });
  }

  void _startSending(int fileSize) async {
    final socket = await ref.read(udpSocketProvider.future);
    final userName = StorageHelper().loadName();
    final message = UdpDiscoveryMessage(
        user: UserModel(name: userName), availableStorage: fileSize);

    // Send hello message every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      try {
        broadcastUdpMessage(socket: socket, message: message);
        // socket.send(messageBytes, broadcastAddress, udpPort);
      } catch (e) {
        // Handle any errors silently or log them if needed
        debugPrint('Error sending UDP hello message: $e');
      }
    });
  }
}

void broadcastUdpMessage({
  required RawDatagramSocket socket,
  required UdpMessage message,
}) {
  socket.broadcastEnabled = true;

  final messageJson = message.toJson();
  final messageBytes = utf8.encode(messageJson);
  final broadcastAddress = InternetAddress('255.255.255.255');
  log('Sending UDP $messageJson to ${broadcastAddress.address}:$udpPort');
  socket.send(messageBytes, broadcastAddress, udpPort);
}

// A provider that listens for udp file messages and sends them to the files provider
@riverpod
void listenForUdpFileMessages(Ref ref) {
  final storage = ref.watch(userSettingsProvider);
  ref.listen(udpDataStreamProvider, (previous, next) {
    final datagram = next.value;
    if (datagram == null) return;
    final senderIpAddress = datagram.address.address;
    final data = datagram.data;
    final message = utf8.decode(data);
    final messageObject = UdpMessageMapper.fromJson(message);
    if (messageObject
        case UdpFileMessage(
          fileIds: final requestedFileIds,
        )) {
      log('Received UDP file message from $senderIpAddress: $requestedFileIds');

      final files = ref.read(filesProviderProvider).fileWithContent;

      for (final file in files) {
        final content = file.content;
        if (content case FileContentAvailable(content: final contentValue)) {
          if (requestedFileIds.contains(file.id)) {
            sendTcpMessage(
              targetIp: senderIpAddress,
              message: TcpFileMessage(
                fileId: file.id,
                content: contentValue,
              ),
            );
          }
        }
      }
    } else if (messageObject
        case UdpUploadMessage(
          fileSize: final requestedFileSize,
        )) {
      if (storage.offeredStorageMB <= requestedFileSize) {
        receiveMessageContent(ref);
      }
    }
  });
}

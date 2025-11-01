import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      final localIpAddress = await getCurrentIpAddress();
      if (senderIpAddress == localIpAddress) return;
      final data = datagram.data;
      final message = utf8.decode(data);
      final messageObject = UdpMessageMapper.fromJson(message);
      if (messageObject is DiscoveryMessage) {
        final user = messageObject.user;
        final timestamp = DateTime.now();
        final userWrapper = UserModelWrapper(
          ipAddress: senderIpAddress,
          user: user,
          timestamp: timestamp,
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

  const UserModelWrapper({
    required this.ipAddress,
    required this.user,
    required this.timestamp,
  });

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
class DiscoveryMessage extends UdpMessage with DiscoveryMessageMappable {
  final UserModel user;
  const DiscoveryMessage({
    required this.user,
    super.type = 'discovery',
  });
}

/// Provider that sends hello messages via UDP every second
@riverpod
class UdpHelloSender extends _$UdpHelloSender {
  Timer? _timer;

  @override
  void build() {
    // Start sending hello messages
    _startSending();

    // Clean up timer when provider is disposed
    ref.onDispose(() {
      _timer?.cancel();
      _timer = null;
    });
  }

  void _startSending() async {
    final socket = await ref.read(udpSocketProvider.future);
    final userName = StorageHelper().loadName();

    // Enable broadcast mode on the socket
    socket.broadcastEnabled = true;

    final message = DiscoveryMessage(user: UserModel(name: userName));
    final messageJson = message.toJson();
    final messageBytes = utf8.encode(messageJson);

    // Broadcast address - sends to all devices on the network
    final broadcastAddress = InternetAddress('255.255.255.255');

    // Send hello message every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      try {
        socket.send(messageBytes, broadcastAddress, udpPort);
      } catch (e) {
        // Handle any errors silently or log them if needed
        debugPrint('Error sending UDP hello message: $e');
      }
    });
  }
}

/// Data class representing received UDP data
class UdpData {
  final Uint8List data;

  const UdpData({
    required this.data,
  });
}

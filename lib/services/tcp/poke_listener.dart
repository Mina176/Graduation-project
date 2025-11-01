// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'dart:io';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduation_project/screens/files_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'poke_listener.g.dart';
part 'poke_listener.mapper.dart';

// The port to listen on for TCP connections
const int tcpPort = 4444;

/// Provider that creates and binds a TCP server socket on the specified port
@riverpod
Future<ServerSocket?> serverSocket(Ref ref) async {
  try {
    final server = await ServerSocket.bind(
      InternetAddress.anyIPv4,
      tcpPort,
    );

    // Close the server socket when the provider is disposed
    ref.onDispose(() {
      server.close();
    });

    return server;
  } catch (e) {
    debugPrint('Error binding TCP server socket: $e');
    return null;
  }
}

@MappableClass(
  discriminatorKey: 'type',
)
sealed class TcpMessage with TcpFileMessageMappable {
  const TcpMessage({required this.type});
  final String type;
}

@MappableClass(discriminatorValue: 'file')
class TcpFileMessage extends TcpMessage with TcpFileMessageMappable {
  final String fileId;
  final String content;
  const TcpFileMessage({
    required this.fileId,
    required this.content,
    super.type = 'file',
  });
}

@MappableClass()
class TcpMessageWrapper with TcpMessageWrapperMappable {
  final String ipAddress;
  final TcpMessage message;
  const TcpMessageWrapper({required this.ipAddress, required this.message});
}

/// Stream provider that continuously listens for incoming TCP connections
@riverpod
Stream<TcpMessageWrapper> serverSocketStream(Ref ref) async* {
  final server = await ref.watch(serverSocketProvider.future);
  if (server == null) {
    return;
  }
  ref.onDispose(() {
    server.close();
  });

  await for (final socket in server) {
    final dataIntList = await socket.first;
    final dataJson = utf8.decode(dataIntList);
    final dataObject = TcpMessageMapper.fromJson(dataJson);
    final message = TcpMessageWrapper(
      ipAddress: socket.remoteAddress.address,
      message: dataObject,
    );
    yield message;
    socket.destroy();
    socket.close();
  }
}

@riverpod
void receiveMessageContent(Ref ref) {
  ref.listen(serverSocketStreamProvider, (previous, next) {
    final message = next.value;
    if (message == null) return;
    if (message.message case TcpFileMessage(:final fileId, :final content)) {
      ref
          .read(filesProviderProvider.notifier)
          .downloadContent(fileId: fileId, content: content);
    }
  });
}

// //Save message to database provider
// @riverpod
// Future<void> saveMessageToDatabase(Ref ref) async {
//   ref.listen(serverSocketStreamProvider, (previous, next) {
//     final message = next.value;
//     if (message == null) return;
//     // StorageHelper().saveMessage(message.message, type: MessageType.received);
//   });
// }

void sendSnackBar({required String message, required BuildContext context}) {
  final snackBar = SnackBar(
    content: Text(message, style: TextStyle(fontSize: 16)),
    duration: Duration(seconds: 3),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'dart:io';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduation_project/services/storage_helper/message_model.dart';
import 'package:graduation_project/services/storage_helper/storage_helper.dart';
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

@MappableClass()
class TcpMessage with TcpMessageMappable {
  final String ipAddress;
  final Message message;
  const TcpMessage({required this.ipAddress, required this.message});
}

/// Stream provider that continuously listens for incoming TCP connections
@riverpod
Stream<TcpMessage> serverSocketStream(Ref ref) async* {
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
    final dataObject = MessageMapper.fromJson(dataJson);
    final message = TcpMessage(
        ipAddress: socket.remoteAddress.address, message: dataObject);
    yield message;
    socket.destroy();
    socket.close();
  }
}

//Save message to database provider
@riverpod
Future<void> saveMessageToDatabase(Ref ref) async {
  ref.listen(serverSocketStreamProvider, (previous, next) {
    final message = next.value;
    if (message == null) return;
    StorageHelper().saveMessage(message.message, type: MessageType.received);
  });
}

void sendSnackBar({required String message, required BuildContext context}) {
  final snackBar = SnackBar(
    content: Text(message, style: TextStyle(fontSize: 16)),
    duration: Duration(seconds: 3),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

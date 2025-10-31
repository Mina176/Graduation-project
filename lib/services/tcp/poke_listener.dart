// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation_project/services/storage_helper/message_model.dart';
import 'package:graduation_project/services/storage_helper/storage_helper.dart';

// The port you agree on. Must be the same everywhere.
const int port = 4444;
ServerSocket? serverSocket; // Keep a reference to it

Future<void> startListener({
  required BuildContext context,
}) async {
  // Prevent starting multiple listeners
  if (serverSocket != null) {
    sendSnackBar(
      message: 'listener is already running.',
      context: context,
    );
    return;
  }

  try {
    // Bind the server to all available network interfaces on the port
    serverSocket = await ServerSocket.bind(InternetAddress.anyIPv4, port);

    // Listen for incoming messages
    serverSocket!.listen((Socket client) {
      client.listen((data) async {
        final receivedMessage = String.fromCharCodes(data);
        final messageModel = Message.fromJson(receivedMessage);

        await StorageHelper().saveMessage(
          messageModel,
          type: MessageType.received,
        );
      });
    });
  } catch (e) {
    sendSnackBar(
      message: ' Failed to start poke listener: $e',
      context: context,
    );
    serverSocket = null;
  }
}

void sendSnackBar({required String message, required BuildContext context}) {
  final snackBar = SnackBar(
    content: Text(message, style: TextStyle(fontSize: 16)),
    duration: Duration(seconds: 3),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

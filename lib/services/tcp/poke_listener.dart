// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:flutter/material.dart'; // For utf8 encoding

// The port you agree on. Must be the same everywhere.
const int pokePort = 4444;

ServerSocket? _serverSocket; // Keep a reference to it

Future<void> startPokeListener({required BuildContext context}) async {
  // Prevent starting multiple listeners
  if (_serverSocket != null) {
    sendSnackBar(
      message: 'Poke listener is already running.',
      context: context,
    );
    return;
  }

  try {
    // Bind the server to all available network interfaces on the port
    _serverSocket = await ServerSocket.bind(InternetAddress.anyIPv4, pokePort);

    sendSnackBar(
      message: ' Poke listener started on port $pokePort.',
      context: context,
    );
    // Listen for incoming connections
    _serverSocket!.listen((Socket client) {
      sendSnackBar(
        message: ' Incoming poke from ${client.remoteAddress.address}',
        context: context,
      );

      // Handle data from the connected client
    });
  } catch (e) {
    sendSnackBar(
      message: ' Failed to start poke listener: $e',
      context: context,
    );
    _serverSocket = null;
  }
}

void sendSnackBar({required String message, required BuildContext context}) {
  final snackBar = SnackBar(
    content: Text(message, style: TextStyle(fontSize: 16)),
    duration: Duration(seconds: 3),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

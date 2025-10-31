import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/services/storage_helper/message_model.dart';

// Must use the same port
const int port = 4444;

Future<void> sendMessage({
  required String targetIp,
  required Message message,
  required BuildContext context,
}) async {
  try {
    final
        // Connect to the target IP and port
        // We add a timeout in case the user is offline
        Socket socket = await Socket.connect(
      targetIp,
      port,
      timeout: Duration(seconds: 5),
    );
    print('Connected to $targetIp:$port for sending message.');
    // Send the message
    socket.write(message.toJson());
    // ignore: use_build_context_synchronously
    // sendSnackBar(message: message, context: context);

    // Wait for the data to be sent, then close the connection
    await socket.flush();
    socket.close();
  } on SocketException catch (e) {
    // This happens if the connection times out or is refused
    // (e.g., user is offline or firewall is blocking)
    print('Failed to send message $targetIp: ${e.message}');
  } catch (e) {
    print('An unexpected error occurred: $e');
  }
}

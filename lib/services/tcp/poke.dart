import 'dart:io';
import 'dart:convert'; // For utf8 encoding

// Must use the same port
const int pokePort = 4444;

Future<void> sendPoke({
  required String targetIp,
  required String message,
}) async {

  try {
    // Connect to the target IP and port
    // We add a timeout in case the user is offline
    Socket socket = await Socket.connect(
      targetIp,
      pokePort,
      timeout: Duration(seconds: 5),
    );


    // Send the message
    socket.write(utf8.encode(message));

    // Wait for the data to be sent, then close the connection
    await socket.flush();
    socket.close();

  } on SocketException catch (e) {
    // This happens if the connection times out or is refused
    // (e.g., user is offline or firewall is blocking)
    print('Failed to poke $targetIp: ${e.message}');
  } catch (e) {
    print('An unexpected error occurred: $e');
  }
}

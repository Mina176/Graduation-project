import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class UdpDiscovery {
  final int port = 4444;
  String? localIpAddress;
  late RawDatagramSocket _socket;
  final Map<String, DateTime> onlineUsers = {};
  final StreamController<Map<String, String>> _userStreamController =
      StreamController.broadcast();

  // Expose the stream for your UI to listen to
  Stream<Map<String, String>> get userStream => _userStreamController.stream;

  Future<String> getIpAddress() async {
    List<NetworkInterface> interfaces = await NetworkInterface.list(
      type: InternetAddressType.IPv4,
      includeLoopback: false,
    );

    for (var interface in interfaces) {
      for (var address in interface.addresses) {
        print(address.address.toString());
        localIpAddress = address.address;
        return localIpAddress!;
      }
    }
    throw Exception('No ipv4 address found');
  }

  // 1. Initialize and bind the socket once
  Future<void> initializeDiscovery() async {
    localIpAddress = await getIpAddress();
    _socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, port);
    _socket.broadcastEnabled = true;
    print('UDPDiscovery socket initialized on port $port');
    listenForUsers(); // Start listening immediately
  }

  // 2. Start sending periodic broadcasts
  void startSending(String userName) {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      // No need to send the IP, the packet header has it
      final Uint8List message = utf8.encode('Hello|$userName');
      _socket.send(message, InternetAddress('255.255.255.255'), port);
    });
  }

  void listenForUsers() {
    print('Listening for users...');
    _socket.listen((RawSocketEvent event) {
      if (event == RawSocketEvent.read) {
        final Datagram? datagram = _socket.receive();
        if (datagram == null) return;

        // Get the sender's IP from the datagram packet
        final String senderIp = datagram.address.address;

        // Filter out our own messages
        // if (senderIp == localIpAddress) {
        //   return;
        // }

        final message = utf8.decode(datagram.data);
        final parts = message.split('|'); // e.g., ['Hello', 'UserName']
        if (parts.length == 2 && parts[0] == 'Hello') {
          final String senderName = parts[1];
          final Map<String, String> userInfo = {senderIp: senderName};

          // Add to our stream for the UI
          _userStreamController.add(userInfo);

          // You can also update your onlineUsers map here
          onlineUsers[senderIp] = DateTime.now();
        }
      }
    });
  }

  // Call this when you're done
  void dispose() {
    _socket.close();
    _userStreamController.close();
  }
}

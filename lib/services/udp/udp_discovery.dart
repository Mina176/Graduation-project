import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class UdpDescovery {
  final int port = 4444;
  String? localIpAdress;
  late Map<String, String> userInfo;
  late List<String> senderMessage;
  final Map<String, DateTime> onlineUsers = {};
  Future<String> getIpAdress() async {
    List<NetworkInterface> interfaces = await NetworkInterface.list(
      type: InternetAddressType.IPv4,
      includeLoopback: false,
    );
    for (var interface in interfaces) {
      for (var address in interface.addresses) {
        print(address.address.toString());
        localIpAdress = address.address;
        return localIpAdress!;
      }
    }
    throw Exception('No ipv4 address found');
  }

  Future<void> sendingMessage(String userName) async {
    final RawDatagramSocket socket = await RawDatagramSocket.bind(
      InternetAddress.anyIPv4,
      port,
    );
    socket.broadcastEnabled = true;
    localIpAdress = await getIpAdress();
    final Uint8List message = utf8.encode('Hello|$userName|$localIpAdress');
    print('this is the encoded hello message :$message');
    //255.255.255.255 it is a special ip address that means send this packet to everyone on the local network
    socket.send(message, InternetAddress('255.255.255.255'), port);
  }

  Stream<Map<String, String>> listenForUsers() async* {
    final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, port);

    print('listening now');
    localIpAdress ??= await getIpAdress();
    await for (final event in socket) {
      if (event == RawSocketEvent.read) {
        final Datagram? datagram = socket.receive();
        if (datagram != null) {
          final message = utf8.decode(datagram.data);
          senderMessage = message.split('|');
          // if (localIpAdress == senderMessage[2]) {
          //   continue;
          // }

          userInfo = {senderMessage[1]: senderMessage[2]};

          yield userInfo;
        }
      }
    }
  }
}

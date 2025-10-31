import 'dart:async';
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/home_screen.dart';
import 'package:graduation_project/screens/recieved_messages.dart';
import 'package:graduation_project/services/tcp/poke_listener.dart';
import 'package:graduation_project/services/udp/udp_discovery.dart';
import 'package:graduation_project/services/storage_helper/storage_helper.dart';

class RootHomeScreen extends StatefulWidget {
  const RootHomeScreen({super.key});

  @override
  State<RootHomeScreen> createState() => _RootHomeScreenState();
}

class _RootHomeScreenState extends State<RootHomeScreen> {
  StreamSubscription<Map<String, String>>? userSubscription;
  final Map<String, String> onlineUsers = {};
  final UdpDiscovery udpDiscovery = UdpDiscovery();

  @override
  void initState() {
    super.initState();
    _initializeDiscovery();
    startListener(context: context);
  }

  // Helper method for async initialization
  Future<void> _initializeDiscovery() async {
    try {
      // 1. Initialize the UdpDiscovery service ONCE using the instance variable
      await udpDiscovery.initializeDiscovery();

      // Consider making loadName async if it might involve async operations in the future.

      // 2. Start sending broadcasts ONCE with the fetched username
      // Use the correct method name 'startSending'
      String userName = StorageHelper().loadName();
      udpDiscovery.startSending(userName);

      // 3. Listen to the userStream for discovered users
      // Use the instance variable _udpDiscovery and listen to userStream
      userSubscription = udpDiscovery.userStream.listen((user) {
        if (mounted) {
          // Check if the widget is still in the tree
          setState(() {
            // Add or update the user in the map
            onlineUsers.addAll(user);
            // Optionally: Add logic here to remove users who haven't responded
            // recently, based on the _udpDiscovery.onlineUsers map timestamps.
          });
        }
      }, onError: (error) {
        print("Error listening to user stream: $error");
        if (mounted) {
          sendSnackBar(
              message: "Discovery Stream Error: $error", context: context);
        }
      });
    } catch (e) {
      print("Failed to initialize UDP Discovery: $e");
      if (mounted) {
        // Use the sendSnackBar from the listener file (via alias)

        sendSnackBar(
          message: 'Network discovery failed: $e',
          context: context,
        );
      }
    }
  }

  @override
  void dispose() {
    // 4. Clean up resources when the widget is removed
    userSubscription?.cancel(); // Cancel the stream subscription (if it exists)
    udpDiscovery.dispose(); // Close the UDP socket
    // Make sure to dispose of your TCP listener if needed (add a stop function)
    // tcp_listener.stopListener(); // Example hypothetical function
    serverSocket?.close(); // Close the TCP server socket
    serverSocket = null;
    super.dispose();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.send),
            label: 'Sent',
          ),
          NavigationDestination(
            icon: Icon(Icons.wifi),
            label: 'Recieved',
          ),
        ],
        onDestinationSelected: (int index) {
          currentIndex = index;
          setState(() {});
        },
        selectedIndex: currentIndex,
      ),
      body: <Widget>[
        HomeScreen(
          onlineUsers: onlineUsers,
        ),
        MessagesList(
          key: Key('sent'),
          type: MessageType.sent,
        ),
        MessagesList(
          key: Key('received'),
          type: MessageType.received,
        ),
      ][currentIndex],
    );
  }
}


  // Helper method for async initialization
  
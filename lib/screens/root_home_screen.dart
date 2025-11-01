import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduation_project/screens/home_screen.dart';
import 'package:graduation_project/screens/recieved_messages.dart';
import 'package:graduation_project/services/storage_helper/storage_helper.dart';
import 'package:graduation_project/services/tcp/poke_listener.dart';
import 'package:graduation_project/services/udp/udp_discovery.dart';

class RootHomeScreen extends ConsumerStatefulWidget {
  const RootHomeScreen({super.key});

  @override
  ConsumerState<RootHomeScreen> createState() => _RootHomeScreenState();
}

class _RootHomeScreenState extends ConsumerState<RootHomeScreen> {
  @override
  void initState() {
    super.initState();
    startListener(context: context);
  }

  @override
  void dispose() {
    serverSocket?.close();
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
        HomeScreen(),
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

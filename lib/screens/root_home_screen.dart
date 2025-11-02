import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduation_project/screens/files_screen.dart';
import 'package:graduation_project/screens/home_screen.dart';
import 'package:graduation_project/services/tcp/poke_listener.dart';
import 'package:graduation_project/services/udp/udp_discovery.dart';

class RootHomeScreen extends ConsumerStatefulWidget {
  const RootHomeScreen({super.key});

  @override
  ConsumerState<RootHomeScreen> createState() => _RootHomeScreenState();
}

class _RootHomeScreenState extends ConsumerState<RootHomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // ref.listen(serverSocketStreamProvider, (previous, next) {
    //   final message = next.value;
    //   if (message == null) return;
    //   sendSnackBar(message: message.message.content, context: context);
    // });
    // ref.watch(saveMessageToDatabaseProvider);
    ref.watch(udpHelloSenderProvider);
    ref.watch(listenForUdpFileMessagesProvider);
    ref.watch(filesProviderProvider);
    ref.watch(receiveMessageContentProvider);
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
      body: <Widget>[HomeScreen(), FilesScreen(), SizedBox()][currentIndex],
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/login_screen.dart';
import 'package:graduation_project/services/tcp/poke.dart';
import 'package:graduation_project/services/tcp/poke_listener.dart';
import 'package:graduation_project/services/udp/udp_discovery.dart';
import 'package:graduation_project/storage_helper/storage_helper.dart';
import 'package:graduation_project/widgets/custom_btn.dart';
import 'package:graduation_project/widgets/custom_list_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  StreamSubscription<Map<String, String>>? _userSubscription;
  final Map<String, String> onlineUsers = {};
  final UdpDiscovery udpDiscovery = UdpDiscovery();
  String _userName = 'Loading...';

  TextEditingController messageContoller = TextEditingController();

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
      if (mounted) {
        setState(() {
          _userName = StorageHelper().loadName();
        }); // Update UI with the fetched username
      }

      // 2. Start sending broadcasts ONCE with the fetched username
      // Use the correct method name 'startSending'
      udpDiscovery.startSending(_userName);

      // 3. Listen to the userStream for discovered users
      // Use the instance variable _udpDiscovery and listen to userStream
      _userSubscription = udpDiscovery.userStream.listen((user) {
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
    _userSubscription
        ?.cancel(); // Cancel the stream subscription (if it exists)
    udpDiscovery.dispose(); // Close the UDP socket
    // Make sure to dispose of your TCP listener if needed (add a stop function)
    // tcp_listener.stopListener(); // Example hypothetical function
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, $_userName!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              Expanded(
                child: onlineUsers.isEmpty
                    ? Center(
                        child: Text("Searching for users...",
                            style: TextStyle(color: Colors.grey)))
                    : ListView.separated(
                        itemCount: onlineUsers.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(),
                        itemBuilder: (context, index) {
                          final userName =
                              onlineUsers.entries.elementAt(index).key;
                          final userIp =
                              onlineUsers.entries.elementAt(index).value;
                          return CustomListTile(
                            name: userName,
                            localIpAddress: userIp,
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    padding: EdgeInsets.all(16),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(height: 8),
                                          TextField(
                                            controller: messageContoller,
                                            autofocus: true,
                                            cursorColor: Colors.blue,
                                            decoration: InputDecoration(
                                              focusedBorder: buildOutlineBorder(
                                                  Colors.blue),
                                              border: buildOutlineBorder(
                                                  Colors.white),
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: CustomBtn(
                                                    btnText: 'Cancel',
                                                    btnColor: Colors.grey,
                                                    onTap: () =>
                                                        Navigator.of(context)
                                                            .pop()),
                                              ),
                                              SizedBox(width: 8),
                                              Expanded(
                                                child: CustomBtn(
                                                  btnText: 'Send',
                                                  onTap: () {
                                                    if (messageContoller
                                                        .text.isEmpty) {
                                                      return;
                                                    }
                                                    Navigator.of(context).pop();
                                                    sendMessage(
                                                        context: context,
                                                        targetIp: userIp,
                                                        message: messageContoller
                                                            .text // Use state variable
                                                        );
                                                    messageContoller.clear();
                                                    sendSnackBar(
                                                        message:
                                                            'Message sent to $userName!', // More specific message
                                                        context: context);
                                                  },
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

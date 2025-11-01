import 'package:flutter/material.dart';
import 'package:graduation_project/screens/info_screen.dart';
import 'package:graduation_project/screens/send_message.dart';
import 'package:graduation_project/services/storage_helper/storage_helper.dart';
import 'package:graduation_project/widgets/custom_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.onlineUsers,
  });
  final Map<String, String> onlineUsers;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userName = StorageHelper().loadName();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello, $userName!',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InfoScreen(
                      username: userName,
                    ),
                  ),
                );
              })
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CustomAppBar(userName: userName),
              SizedBox(height: 8),
              Expanded(
                child: widget.onlineUsers.isEmpty
                    ? Center(
                        child: Text("Searching for users...",
                            style: TextStyle(color: Colors.grey)))
                    : ListView.separated(
                        itemCount: widget.onlineUsers.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(),
                        itemBuilder: (context, index) {
                          final userName =
                              widget.onlineUsers.entries.elementAt(index).value;
                          final userIp =
                              widget.onlineUsers.entries.elementAt(index).key;
                          return CustomListTile(
                            name: userName,
                            localIpAddress: userIp,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SendMessage(
                                    userIp: userIp,
                                  ),
                                ),
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

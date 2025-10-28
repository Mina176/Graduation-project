import 'package:flutter/material.dart';

import 'package:graduation_project/storage_helper/storage_helper.dart';
import 'package:graduation_project/widgets/custom_list_item.dart';
import 'package:graduation_project/widgets/send_message_sheet.dart';

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, $userName!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
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
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return SendMessageSheet(
                                      userIp: userIp, userName: userName);
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

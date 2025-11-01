import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduation_project/screens/login_screen.dart';
import 'package:graduation_project/screens/send_message.dart';
import 'package:graduation_project/services/storage_helper/storage_helper.dart';
import 'package:graduation_project/services/udp/udp_discovery.dart';
import 'package:graduation_project/widgets/custom_list_item.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    super.key,
  });
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final userName = StorageHelper().loadName();
  @override
  Widget build(BuildContext context) {
    ref.watch(udpHelloSenderProvider);
    final users = ref.watch(userStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello, $userName!',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await StorageHelper().clearData();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
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
                child: users.isEmpty
                    ? Center(
                        child: Text("Searching for users...",
                            style: TextStyle(color: Colors.grey)))
                    : ListView.separated(
                        itemCount: users.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(),
                        itemBuilder: (context, index) {
                          final user = users.elementAt(index);
                          return CustomListTile(
                            name: user.user.name,
                            localIpAddress: '1.1.1.1',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SendMessage(
                                    userIp: '1.1.1.1',
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

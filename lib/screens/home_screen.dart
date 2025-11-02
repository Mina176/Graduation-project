import 'package:flutter/material.dart';
import 'package:graduation_project/screens/info_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduation_project/services/storage_helper/storage_helper.dart';
import 'package:graduation_project/services/udp/udp_discovery.dart';

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
    final state = ref.watch(userStreamProvider);

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
                child: state.users.isEmpty
                    ? Center(
                        child: Text("Searching for users...",
                            style: TextStyle(color: Colors.grey)))
                    : ListView.separated(
                        itemCount: state.users.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(),
                        itemBuilder: (context, index) {
                          final user = state.users.elementAt(index);
                          return ListTile(
                            iconColor: Colors.green,
                            leading: const Icon(Icons.devices),
                            title: Text(user.user.name),
                            subtitle:
                                Text('${user.ipAddress}\n${user.timestamp}'),
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

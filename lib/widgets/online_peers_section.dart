import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/custom_list_item.dart';

class OnlinePeersSection extends StatelessWidget {
  const OnlinePeersSection({
    super.key,
    required this.numberOfOnlineUsers,
    required this.users,
    required this.onPressed,
  });
  final Map<String, String> users;
  final int numberOfOnlineUsers;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: numberOfOnlineUsers,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (context, index) {
        return CustomListTile(
          name: users.entries.elementAt(index).key,
          localIpAddress: users.entries.elementAt(index).value,
          onPressed: onPressed,
        );
      },
    );
  }
}

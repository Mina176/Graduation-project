import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.name,
    required this.localIpAddress,
    required this.onPressed,
  });
  final String name;
  final String localIpAddress;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: Colors.green,
      leading: const Icon(
        Icons.devices,
        size: 40,
      ),
      title: Text(name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
      subtitle: Text(localIpAddress,
          style: TextStyle(color: Colors.grey, fontSize: 16)),
      trailing: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Poke',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

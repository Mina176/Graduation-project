import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(50)),
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Name', style: TextStyle(fontSize: 18)),
            Text('192.168.1.26', style: TextStyle(color: Colors.grey)),
          ],
        ),
        const Spacer(),
        MaterialButton(
            onPressed: () {},
            color: Colors.blueAccent,
            textColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const Text('Poke')),
      ],
    );
  }
}

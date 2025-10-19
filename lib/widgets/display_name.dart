import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisplayName extends StatelessWidget {
  const DisplayName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: showName(),
      builder: (context, snapshot) => Row(
        children: [
          Text(
            '${snapshot.data}',
            style: const TextStyle(fontSize: 24),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
        ],
      ),
    );
  }

  Future<String> showName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString('name');
    return name ?? 'No name found';
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: showName(),
          builder: (context, snapshot) {
            return Text(
              'Welcome, ${snapshot.data}!',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
    );
  }

  Future<String> showName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString('name');
    return name ?? 'No name found';
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: showName(),
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${snapshot.data}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<String> showName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString('name');
    return name ?? 'No name found';
  }
}

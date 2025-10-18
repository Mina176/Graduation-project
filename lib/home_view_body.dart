import 'package:flutter/material.dart';
import 'package:graduation_project/custom_list_item.dart';
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
            children: [
              Row(
                children: [
                  Text(
                    '${snapshot.data}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (context, index) {
                    return CustomListTile();
                  },
                  itemCount: 10,
                ),
              )
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

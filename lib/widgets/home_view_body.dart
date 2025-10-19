import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/display_name.dart';
import 'package:graduation_project/widgets/online_peers_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          DisplayName(),
          SizedBox(height: 8),
          OnlinePeersSection()
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/custom_list_item.dart';

class OnlinePeersSection extends StatelessWidget {
  const OnlinePeersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(),
        itemBuilder: (context, index) {
          return CustomListTile();
        },
        itemCount: 3,
      ),
    );
  }
}
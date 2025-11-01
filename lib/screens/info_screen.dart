import 'package:flutter/material.dart';
import 'package:graduation_project/screens/login_screen.dart';
import 'package:graduation_project/services/storage_helper/storage_helper.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key, required this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.person,
              size: 48,
            ),
            title: Text(
              username,
            ),
            trailing: ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
                await StorageHelper().clearData();
              },
              child: Text('Log out'),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          PrettyQrView.data(
            data: StorageHelper().loadPasswordBase64()!,
            decoration: const PrettyQrDecoration(
              quietZone: PrettyQrQuietZone.standart,
            ),
          )
        ],
      ),
    );
  }
}

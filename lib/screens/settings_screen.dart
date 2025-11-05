import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduation_project/screens/login_screen.dart';
import 'package:graduation_project/services/storage_helper/storage_helper.dart';

import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class InfoScreen extends ConsumerStatefulWidget {
  const InfoScreen({super.key, required this.username});
  final String username;

  @override
  ConsumerState<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends ConsumerState<InfoScreen> {
  late QrImage qrImage;

  String username = StorageHelper().loadName();
  String password = StorageHelper().loadPasswordBase64()!;

  Map<String, dynamic> get userData => {
        "username": username,
        "password": password,
      };

  String get jsonString => jsonEncode(userData);

  @override
  void initState() {
    super.initState();
    QrCode qrCode = QrCode.fromData(
      data: jsonString,
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );
    qrImage = QrImage(qrCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          ListTile(
            leading: Icon(
              Icons.person,
              size: 48,
            ),
            title: Text(
              widget.username,
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
          TextField(
            maxLength: 18,
            decoration: InputDecoration(
              labelText: 'Offered Storage (MB)',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              // ref.read(userSettingsProvider.notifier).updateOfferedStorageMB(
              //       int.tryParse(value) ?? 0,
              //     );
              StorageHelper().saveAvailbleStorageInBytes(
                int.tryParse(value) ?? 0,
              );
            },
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          SizedBox(height: 32),
          SizedBox(
            width: 250,
            child: Text(
              'This is your Backup Qr Code\nTake screenshot Keep it in a safe place',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 250,
            child: PrettyQrView(
              qrImage: qrImage,
            ),
          ),
        ],
      ),
    );
  }
}

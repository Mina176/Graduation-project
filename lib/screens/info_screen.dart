import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/login_screen.dart';
import 'package:graduation_project/services/storage_helper/storage_helper.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, required this.username});
  final String username;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  late QrImage qrImage;

  @override
  void initState() {
    super.initState();

    final qrCode = QrCode.fromData(
      data: StorageHelper().loadPasswordBase64()!,
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );

    qrImage = QrImage(qrCode);
  }

  Future<void> _saveQrCode() async {
    try {
      // --- 1. Request Storage Permission ---
      var status = await Permission.storage.request();
      if (!status.isGranted) {
        _showSnackBar("Storage permission denied");
        return;
      }

      // --- 2. Generate Image Bytes ---
      final ByteData? byteData = await qrImage.toImageAsBytes(
        size: 512,
        format: ui.ImageByteFormat.png,
        decoration: const PrettyQrDecoration(),
      );

      if (byteData == null) {
        _showSnackBar("Failed to generate QR code image");
        return;
      }

      final Uint8List pngBytes = byteData.buffer.asUint8List();

      // --- 3. Save Image to Gallery ---
      final result = await ImageGallerySaver.saveImage(
        pngBytes,
        quality: 100,
        name: "qr_code_${DateTime.now().millisecondsSinceEpoch}",
      );

      if (result['isSuccess'] == true) {
        _showSnackBar("QR Code saved to Gallery!");
      } else {
        _showSnackBar("Failed to save QR code: ${result['errorMessage']}");
      }
    } catch (e) {
      _showSnackBar("An error occurred: $e");
    }
  }

  /// Helper to show a SnackBar
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
          SizedBox(height: 32),
          Text(
            'This is your Backup Qr Code, Keep it in a safe place',
          ),
          SizedBox(
            height: 250,
            child: PrettyQrView(
              qrImage: qrImage,
            ),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.save_alt),
            label: const Text("Save to Gallery"),
            onPressed: _saveQrCode,
          ),
        ],
      ),
    );
  }
}

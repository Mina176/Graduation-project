import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/root_home_screen.dart';
import 'package:graduation_project/services/storage_helper/storage_helper.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:zxing2/qrcode.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();
  final passwordContoller = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter Name',
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: passwordContoller,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        _performLogin(
                            name: nameController.text,
                            password: passwordContoller.text);
                      },
                child: const Text('Login'),
              ),
              ElevatedButton(
                onPressed: _isLoading ? null : _loginWithQrCode,
                child: const Text('Login with Qr Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _performLogin({required String? name, required String? password}) {
    if (name == null || password == null) return;

    // Save the data
    StorageHelper().saveName(name);
    StorageHelper().savePassword(password);

    // Navigate
    if (!mounted) return; // Check if the widget is still in the tree
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const RootHomeScreen(),
      ),
    );
  }

  Future<void> _loginWithQrCode() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No image selected.')),
          );
        }
        return;
      }

      final result = readQrcode(pickedFile.path);

      final Map<String, dynamic> userData = jsonDecode(result);
      final String? username = userData['username'];
      final String? password = userData['password'];
      _performLogin(name: username, password: password);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('An error occurred: $e')));
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}

String readQrcode(String path) {
  try {
    var image = img.decodeJpg(File(path).readAsBytesSync())!;

    LuminanceSource source = RGBLuminanceSource(
        image.width,
        image.height,
        image
            .convert(numChannels: 4)
            .getBytes(order: img.ChannelOrder.abgr)
            .buffer
            .asInt32List());
    var bitmap = BinaryBitmap(GlobalHistogramBinarizer(source));

    var reader = QRCodeReader();
    var result = reader.decode(bitmap);
    print(result.text);
    return result.text;
  } catch (e) {
    throw 'no qr found';
  }
}

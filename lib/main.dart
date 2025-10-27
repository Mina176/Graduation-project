import 'package:flutter/material.dart';
import 'package:graduation_project/screens/home_screen.dart';
import 'package:graduation_project/screens/login_screen.dart';
import 'package:graduation_project/storage_helper/storage_helper.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageHelper().init();
  requestDevicePermissions();
  final isLoggedIn = StorageHelper().isLoggedIn();
  runApp(GraduationProject(isLoggedIn: isLoggedIn));
}

class GraduationProject extends StatelessWidget {
  const GraduationProject({super.key, required this.isLoggedIn});
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? HomeView() : LoginScreen(),
    );
  }
}

Future<void> requestDevicePermissions() async {
  var status = await Permission.nearbyWifiDevices.status;

  if (status.isDenied) {
    await Permission.nearbyWifiDevices.request();
  }
}

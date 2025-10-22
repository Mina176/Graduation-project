import 'package:flutter/material.dart';
import 'package:graduation_project/screens/login.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  requestDevicePermission();
  runApp(GraduationProject());
}

class GraduationProject extends StatelessWidget {
  const GraduationProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}

Future<void> requestDevicePermission() async {
  var status = await Permission.nearbyWifiDevices.status;

  if (status.isDenied) {
    print("Requesting Nearby Devices permission...");
    await Permission.nearbyWifiDevices.request();
  }
}

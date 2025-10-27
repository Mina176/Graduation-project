import 'package:flutter/material.dart';
import 'package:graduation_project/screens/login_screen.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  requestDevicePermissions();
  runApp(GraduationProject());
}

class GraduationProject extends StatelessWidget {
  const GraduationProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}

Future<void> requestDevicePermissions() async {
  var status = await Permission.nearbyWifiDevices.status;

  if (status.isDenied) {
    await Permission.nearbyWifiDevices.request();
  }

}

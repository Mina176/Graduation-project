import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduation_project/screens/login_screen.dart';
import 'package:graduation_project/screens/root_home_screen.dart';
import 'package:graduation_project/services/storage_helper/storage_helper.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageHelper().init();
  requestDevicePermissions();
  final isLoggedIn = StorageHelper().isLoggedIn;
  runApp(
    ProviderScope(
      child: GraduationProject(isLoggedIn: isLoggedIn),
    ),
  );
}

class GraduationProject extends StatelessWidget {
  const GraduationProject({super.key, required this.isLoggedIn});
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
        focusColor: Colors.blue,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      )),
      home: isLoggedIn ? RootHomeScreen() : LoginScreen(),
    );
  }
}

Future<void> requestDevicePermissions() async {
  var status = await Permission.nearbyWifiDevices.status;
  if (status.isDenied) {
    await Permission.nearbyWifiDevices.request();
  }
}

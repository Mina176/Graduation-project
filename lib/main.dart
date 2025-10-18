import 'package:flutter/material.dart';
import 'package:graduation_project/home_page.dart';
import 'package:graduation_project/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final String? name = prefs.getString('name');
  final String initialRoute =
      (name == null || name.isEmpty) ? 'loginPage' : 'homePage';

  runApp(GraduationProject(initialRoute: initialRoute));
}

class GraduationProject extends StatelessWidget {
  final String initialRoute;
  const GraduationProject({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      routes: {
        'loginPage': (context) => LoginPage(),
        'homePage': (context) => HomePage(),
      },
    );
  }
}

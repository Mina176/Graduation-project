import 'package:flutter/material.dart';
import 'package:graduation_project/home_view.dart';
import 'package:graduation_project/login_view.dart';
import 'package:graduation_project/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final String? name = prefs.getString('name');
  final String initialRoute =
      (name == null || name.isEmpty) ? kLoginView : kHomeView;

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
        kLoginView: (context) => LoginView(),
        kHomeView: (context) => HomeView(),
      },
    );
  }
}

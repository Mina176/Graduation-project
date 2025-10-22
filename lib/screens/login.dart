import 'package:flutter/material.dart';
import 'package:graduation_project/screens/home_view_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextField(
            controller: userNameController,
            decoration: InputDecoration(hintText: 'Enter your username'),
            onSubmitted: (value) {
              if (value == '') return;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeViewScreen(name: value),
                ),
              );
              userNameController.clear();
            },
          ),
        ),
      ),
    );
  }
}

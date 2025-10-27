import 'package:flutter/material.dart';
import 'package:graduation_project/screens/home_screen.dart';
import 'package:graduation_project/widgets/custom_btn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();

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
                controller: userNameController,
                decoration: InputDecoration(
                    hintText: 'Enter your name',
                    border: buildOutlineBorder(Colors.grey),
                    focusedBorder: buildOutlineBorder(Colors.blue)),
              ),
              SizedBox(height: 8),
              CustomBtn(
                btnText: 'Login',
                onTap: () {
                  if (userNameController.text == '') return;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HomeView(name: userNameController.text),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  buildOutlineBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 2,
        color: color,
      ),
    );
  }
}

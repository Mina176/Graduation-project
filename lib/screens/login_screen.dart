import 'package:flutter/material.dart';
import 'package:graduation_project/screens/root_home_screen.dart';
import 'package:graduation_project/services/storage_helper/storage_helper.dart';
import 'package:graduation_project/widgets/custom_btn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();
  final passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: nameController,
                hintText: 'Enter Name',
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextField(
                  controller: passwordContoller,
                  hintText: 'Enter Password',
                  obscureText: true),
              SizedBox(height: 8),
              CustomBtn(
                btnText: 'Login',
                onTap: () {
                  if (nameController.text.isEmpty ||
                      passwordContoller.text.isEmpty) {
                    return;
                  }
                  StorageHelper().saveName(nameController.text);
                  StorageHelper().savePassword(passwordContoller.text);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RootHomeScreen(),
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
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.obscureText = false,
    required this.hintText,
  });

  final TextEditingController controller;
  final bool obscureText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
        ));
  }
}

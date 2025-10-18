import 'package:flutter/material.dart';
import 'package:graduation_project/login_page_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LoginPageBody()),
    );
  }
}

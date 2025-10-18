import 'package:flutter/material.dart';
import 'package:graduation_project/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    bool isLoading = false;

    Future<void> saveName(String name) async {
      setState(() {
        isLoading = true;
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', name);

      setState(() {
        isLoading = false;
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hint: Text(
                  'Enter your name',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
                onTap: () {
                  if (nameController.text.isEmpty) return;
                  saveName(nameController.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                },
                child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: isLoading ? Colors.grey : Colors.purple,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                    ))),
          ]),
    );
  }
}

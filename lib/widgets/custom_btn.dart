import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.btnText,
    this.btnColor = Colors.blue,
    this.textColor = Colors.white,
    required this.onTap,
  });
  final String btnText;
  final Color btnColor;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 40,
        width: double.infinity,
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: textColor),
          ),
        ),
      ),
    );
  }
}

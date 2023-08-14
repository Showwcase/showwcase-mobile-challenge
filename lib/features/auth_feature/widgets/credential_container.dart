import 'package:flutter/material.dart';

class CredentialContainer extends StatelessWidget {
  const CredentialContainer(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obscureText = false,
      this.isEmail = false});

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool isEmail;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F9FD),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black, width: 0.1),
      ),
      child: Center(
        child: TextField(
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
          obscureText: obscureText,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFF61677D),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
            suffixIcon: Visibility(
              visible: obscureText,
              child: const Icon(
                Icons.visibility,
                color: Color(0xFF7C8AA0),
              ),
            ),
          ),
          controller: controller,
        ),
      ),
    );
  }
}

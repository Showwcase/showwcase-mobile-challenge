import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/features/auth_feature/controllers/auth_controller.dart';

class SplashPage extends GetView<AuthController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.splashScreen();
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/pokemon-logo.png',
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

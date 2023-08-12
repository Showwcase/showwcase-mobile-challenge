import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/core/utils/logger_util.dart';
import 'package:pokemon/features/auth_feature/screens/sign_in_page.dart';
import 'package:pokemon/features/listing_feature/presentation/screens/home_page.dart';

class AuthController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final _isSignedIn = false.obs;

  bool get passwordValid => passwordController.text.length > 6;
  bool get emailValid => emailController.text.isEmail;
  bool get isSignedIn => _isSignedIn.value;

  /// Validate credential inputs and sign in the user.
  ///
  void signIn() {
    switch ((emailValid, passwordValid)) {
      case (true, true):
        Get.offAll(
          () => const HomePage(),
          transition: Transition.fadeIn,
        );
      case (true, false):
        Get.snackbar(
          'Error',
          'Password should be greater than 6 characters',
        );
      case (false, true):
        Get.snackbar(
          'Error',
          'Please enter valid email',
        );
      case (_, _):
        Get.snackbar(
          'Error',
          'Enter valid credentials',
        );
    }
  }

  /// Dummy sign out method
  ///
  void signOut() {
    _isSignedIn.value = false;
  }

  /// Wait 2 seconds before navigating to home page
  ///
  void splashScreen() {
    Logger.logInfo("Splash screen logic initiated");
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.offAll(() => const SignInPage());
      },
    );
  }
}

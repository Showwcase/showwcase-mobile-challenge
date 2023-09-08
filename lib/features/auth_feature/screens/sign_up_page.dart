import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/config/color_pallete.dart';
import 'package:pokemon/config/screen_size_utility.dart';
import 'package:pokemon/config/widget_utility.dart';
import 'package:pokemon/features/auth_feature/controllers/auth_controller.dart';
import 'package:pokemon/features/auth_feature/widgets/credential_container.dart';
import 'package:pokemon/features/auth_feature/widgets/reaction_icon.dart';

class SignUpPage extends GetView<AuthController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 36),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ReactionIcon(imagePath: "assets/images/clap.png"),
              const Text(
                'Sign Up',
                style: TextStyle(
                  color: Color(0xFF2A4ECA),
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  height: 1.25,
                ),
              ),
              WidgetUtil.smallVSpacer,
              const Text(
                'Create an account to access the world of Pokemon!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF61677D),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.57,
                ),
              ),
              WidgetUtil.mediumVSpacer,
              CredentialContainer(
                controller: controller.nameController,
                hintText: 'Name',
              ),
              WidgetUtil.smallVSpacer,
              CredentialContainer(
                controller: controller.emailController,
                hintText: 'Email',
                isEmail: true,
              ),
              WidgetUtil.smallVSpacer,
              CredentialContainer(
                controller: controller.passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              WidgetUtil.smallVSpacer,
              CredentialContainer(
                controller: controller.passwordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),
              WidgetUtil.mediumVSpacer,
              SizedBox(
                width: ScreenSize.width * 0.8,
                height: 60,
                child: ElevatedButton(
                  onPressed: () => controller.signIn(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPallete.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              WidgetUtil.smallVSpacer,
              Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Already have account? ',
                        style: TextStyle(
                          color: ColorPallete.primaryTextColor,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.57,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign In',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                        style: const TextStyle(
                          color: ColorPallete.secondaryColor,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.57,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/config/color_pallete.dart';
import 'package:pokemon/config/screen_size_utility.dart';
import 'package:pokemon/config/widget_utility.dart';
import 'package:pokemon/features/auth_feature/controllers/auth_controller.dart';
import 'package:pokemon/features/auth_feature/screens/sign_up_page.dart';
import 'package:pokemon/features/auth_feature/widgets/credential_container.dart';
import 'package:pokemon/features/auth_feature/widgets/reaction_icon.dart';

class SignInPage extends GetView<AuthController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 36),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ReactionIcon(imagePath: "assets/images/wave.png"),
              const Text(
                'Sign In',
                style: TextStyle(
                  color: Color(0xFF2A4ECA),
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  height: 1.25,
                ),
              ),
              WidgetUtil.smallVSpacer,
              const Text(
                'Welcome to the world of Pokemon. Please sign in to continue.',
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
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color(0xFF7C8AA0),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.83,
                  ),
                ),
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
                    'Sign In',
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
                        text: 'Don\'t have account? ',
                        style: TextStyle(
                          color: ColorPallete.primaryTextColor,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.57,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(const SignUpPage()),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

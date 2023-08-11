import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/config/color_pallete.dart';
import 'package:pokemon/config/screen_size_utility.dart';
import 'package:pokemon/config/widget_utility.dart';
import 'package:pokemon/features/auth_feature/presentation/controllers/auth_controller.dart';
import 'package:pokemon/features/auth_feature/presentation/screens/sign_up_page.dart';
import 'package:pokemon/features/auth_feature/presentation/widgets/credential_container.dart';

class SignInPage extends GetView<AuthController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: [
            Container(
              width: 90,
              height: 90,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 24),
              decoration: ShapeDecoration(
                color: const Color(0xFFD6DFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/wave.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                controller: controller.emailController, hintText: 'Email'),
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
    );
  }
}

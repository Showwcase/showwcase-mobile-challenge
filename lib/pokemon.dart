import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/core/initializers/get_binding.dart';
import 'package:pokemon/features/auth_feature/screens/splash_page.dart';

class PokemonApp extends StatelessWidget {
  const PokemonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pokemon App',
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      initialBinding: GetBinding(),
      initialRoute: '/',
    );
  }
}

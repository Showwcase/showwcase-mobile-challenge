import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/constants/app_routes.dart';
import 'package:flutter_challenge/src/login/screens/login_screen.dart';
import 'package:flutter_challenge/src/splash/screens/splash_screen.dart';

import 'src/home/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon App',
      theme: ThemeData.light(),
      initialRoute: splashScreen,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case loginScreen:
            return MaterialPageRoute(builder: (_) => LoginScreen());

          case homeScreen:
            return MaterialPageRoute(builder: (_) => HomeScreen());

          default:
            return MaterialPageRoute(builder: (_) => SplashScreen());
        }
      },
    );
  }
}

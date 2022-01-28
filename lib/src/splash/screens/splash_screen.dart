import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/constants/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _startTimer() {
    return Timer(const Duration(seconds: 3), _navigator);
  }

  _navigator() {
    Navigator.pushReplacementNamed(context, loginScreen);
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 200),
                child: Text(
                  'Pokemon App',
                  style: Theme.of(context).textTheme.headline5,
                ),
              )),
              const Spacer(),
              const Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}

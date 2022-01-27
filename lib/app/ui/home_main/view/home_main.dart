import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:showwcase_flutter_challenge/app/ui/home_main/view/build_home_main_body.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () {
        return const Scaffold(
          body: BuildHomeMainBody()
        );
      }
    );
  }
}

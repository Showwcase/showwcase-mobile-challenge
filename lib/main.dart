import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showwcase_flutter_challenge/app/core/util/router.dart';

import 'app/core/util/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pokemon Demo',
      // builder: DevicePreview.appBuilder,
      theme: StyleTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      getPages: PageRouter().routes,
      initialRoute: '/',
    );
  }
}

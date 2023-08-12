import 'package:flutter/material.dart';
import 'package:pokemon/config/color_pallete.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.0),
      child: VerticalDivider(color: ColorPallete.primaryColor),
    );
  }
}

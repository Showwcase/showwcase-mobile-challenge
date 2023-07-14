import 'package:flutter/material.dart';

import 'default_value.dart';

///We will use This class for the whole theme
class StyleTheme {
  ThemeData getTheme() {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: primaryVariant,
        secondaryVariant: secondaryColor,
        onSecondary: onSecondary,
        primaryVariant: primaryVariant,

        ///card bg color
        onPrimary: onPrimary,

        ///text  color
      ),
    );
  }
}

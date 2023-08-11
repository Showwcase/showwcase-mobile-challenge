import 'package:get/get.dart';

class ScreenSize {
  static const double _smallHeight = 650.0;
  static const double _height = 700.0;
  static const double _width = 370.0;

  /// Returns the height of this mobile device.
  static double get height {
    return Get.height;
  }

  /// Returns the width of this mobile device.
  static double get width {
    return Get.width;
  }

  /// Whether the device height is graded as smaller.
  ///
  /// true if <= 650.0
  static bool get isSmaller {
    return height <= _smallHeight;
  }

  /// Whether the device height is graded as small.
  ///
  /// true if <= 700.0
  static bool get isSmall {
    return height <= _height;
  }

  /// Whether the device width is graded as small.
  ///
  /// true if <= 370.0
  static bool get isNarrow {
    return width <= _width;
  }

  /// Whether the device height is below the given [value].
  static bool isBelow(double value) {
    return height < value;
  }

  /// Whether the device height is below the given [value].
  static bool isBelowWidth(double value) {
    return width < value;
  }
}

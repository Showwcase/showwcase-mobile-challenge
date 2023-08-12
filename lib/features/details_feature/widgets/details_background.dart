import 'package:flutter/material.dart';
import 'package:pokemon/config/color_pallete.dart';
import 'package:pokemon/config/screen_size_utility.dart';

class DetailsBackground extends StatelessWidget {
  const DetailsBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height,
      width: ScreenSize.width,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            const Color.fromARGB(255, 0, 122, 150).withOpacity(0.4),
            // Color(0xFF00695C),
            ColorPallete.backgroundColor,
          ],
          radius: 0.75,
          center: const Alignment(0, -0.3),
        ),
      ),
    );
  }
}

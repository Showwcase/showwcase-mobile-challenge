import 'package:flutter/material.dart';
import 'package:pokemon/config/color_pallete.dart';
import 'package:pokemon/config/widget_utility.dart';

class FavouriteCounter extends StatelessWidget {
  const FavouriteCounter({Key? key, this.value = '0'}) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          children: [
            WidgetUtil.mediumHSpacer,
            const Icon(
              Icons.favorite_border_outlined,
              size: 30,
              color: ColorPallete.primaryTextColor,
            ),
            Positioned(
              right: 1,
              top: 0,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                maxRadius: 8,
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

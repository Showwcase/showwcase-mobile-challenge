import 'package:flutter/material.dart';

class TabIcon extends StatelessWidget {
  const TabIcon({super.key, required this.title, required this.isSelected});

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        Visibility(
          visible: isSelected,
          child: Container(
            height: 2,
            width: 30,
            margin: const EdgeInsets.only(top: 5),
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

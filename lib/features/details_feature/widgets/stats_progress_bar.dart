import 'package:flutter/material.dart';
import 'package:pokemon/config/color_pallete.dart';
import 'package:pokemon/config/screen_size_utility.dart';

class StatProgress extends StatefulWidget {
  const StatProgress({
    super.key,
    required this.statName,
    required this.statValue,
  });

  final String statName;
  final int statValue;

  @override
  State<StatProgress> createState() => _StatProgressState();
}

class _StatProgressState extends State<StatProgress> {
  double _width = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _width = (ScreenSize.width * 0.6) * (widget.statValue / 100);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: ScreenSize.width * 0.2,
            height: 40,
            child: Text(
              widget.statName,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 16)
                  .copyWith(color: Colors.grey),
            ),
          ),
          Text(
            widget.statValue.toString(),
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: 16)
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Stack(
            children: [
              Container(
                width: ScreenSize.width * 0.6,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                width: _width,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5.0),
                  gradient: LinearGradient(
                    colors: [
                      ColorPallete.secondaryColor.withOpacity(0.7),
                      Colors.green,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

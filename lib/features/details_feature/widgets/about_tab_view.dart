import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokemon/config/color_pallete.dart';
import 'package:pokemon/config/widget_utility.dart';
import 'package:pokemon/features/listing_feature/data/models/pokemon/pokemon.dart';

class AboutTabView extends StatelessWidget {
  const AboutTabView({super.key, required this.data});

  final Pokemon data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Abilities',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              ...data.abilities!
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        label: Text(e.ability?.name ?? ''),
                        side: BorderSide(
                          color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
        WidgetUtil.smallVSpacer,
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Details',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        WidgetUtil.smallVSpacer,
        Container(
          height: 100,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(0.5),
                Colors.green.withOpacity(0.2),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatWidget(
                title: 'Weight',
                value: '${data.weight} kg',
                icon: const Icon(
                  Icons.monitor_weight_outlined,
                  color: ColorPallete.primaryTextColor,
                ),
              ),
              StatWidget(
                title: 'Height',
                value: '${data.height} m',
                icon: const Icon(
                  Icons.height_outlined,
                  color: ColorPallete.primaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StatWidget extends StatelessWidget {
  const StatWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            icon,
            Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontSize: 16),
        ),
      ],
    );
  }
}

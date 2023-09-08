import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokemon/features/listing_feature/data/models/pokemon/pokemon.dart';

class MovesTabView extends StatelessWidget {
  const MovesTabView({super.key, required this.data});

  final Pokemon data;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 2.6,
        children: [
          ...data.moves!.map(
            (e) => SizedBox(
              height: 20,
              child: Chip(
                label: Text(
                  e.move?.name ?? '',
                ),
                side: BorderSide(
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

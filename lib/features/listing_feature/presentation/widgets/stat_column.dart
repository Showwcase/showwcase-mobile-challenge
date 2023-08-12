import 'package:flutter/material.dart';
import 'package:pokemon/core/utils/stat_filter.dart';
import 'package:pokemon/features/listing_feature/data/models/pokemon/stat.dart';

class StatColumn extends StatelessWidget {
  const StatColumn({Key? key, required this.stats, required this.filter})
      : super(key: key);

  final List<Stat> stats;
  final String filter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          filter,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 15),
        ),
        const SizedBox(height: 5),
        Text(statFilter(stats, filter)),
      ],
    );
  }
}

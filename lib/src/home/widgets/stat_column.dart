import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/home/domain/models/pokemon/stat.dart';
import 'package:flutter_challenge/src/shared/utils/stat_filter.dart';

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
          style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 15),
        ),
        const SizedBox(height: 5),
        Text(statFilter(stats, filter)),
      ],
    );
  }
}

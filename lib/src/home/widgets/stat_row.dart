import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/home/domain/models/pokemon/stat.dart';
import 'package:flutter_challenge/src/shared/utils/stat_filter.dart';

class StatRow extends StatelessWidget {
  const StatRow(
      {Key? key, required this.icon, required this.stats, required this.filter})
      : super(key: key);

  final IconData icon;
  final List<Stat> stats;
  final String filter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey, size: 17),
        const SizedBox(width: 5),
        Text(statFilter(stats, filter)),
      ],
    );
  }
}

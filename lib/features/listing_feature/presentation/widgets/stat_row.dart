import 'package:flutter/material.dart';
import 'package:pokemon/core/utils/stat_filter.dart';
import 'package:pokemon/features/listing_feature/data/models/pokemon/stat.dart';

class StatRow extends StatelessWidget {
  const StatRow(
      {Key? key,
      required this.icon,
      required this.stats,
      required this.filter,
      this.color = Colors.grey})
      : super(key: key);

  final IconData icon;
  final List<Stat> stats;
  final String filter;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 17),
        const SizedBox(width: 5),
        Text(statFilter(stats, filter)),
      ],
    );
  }
}

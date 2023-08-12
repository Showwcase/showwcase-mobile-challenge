import 'package:flutter/material.dart';
import 'package:pokemon/config/widget_utility.dart';
import 'package:pokemon/features/details_feature/widgets/stats_progress_bar.dart';
import 'package:pokemon/features/listing_feature/data/models/pokemon/pokemon.dart';

class StatsTabView extends StatelessWidget {
  const StatsTabView({super.key, required this.data});

  final Pokemon data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetUtil.mediumVSpacer,
        ...data.stats!
            .map((e) => StatProgress(
                  statName: e.stat?.name ?? '',
                  statValue: e.baseStat ?? 0,
                ))
            .toList(),
      ],
    );
  }
}

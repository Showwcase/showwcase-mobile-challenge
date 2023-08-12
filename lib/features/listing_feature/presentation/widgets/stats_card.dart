import 'package:flutter/material.dart';
import 'package:pokemon/config/constants.dart';
import 'package:pokemon/features/listing_feature/data/models/pokemon/pokemon.dart';
import 'package:pokemon/features/listing_feature/presentation/widgets/custom_vertical_divider.dart';
import 'package:pokemon/features/listing_feature/presentation/widgets/stat_column.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({Key? key, required this.data}) : super(key: key);
  final Pokemon data;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Stats',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 17),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StatColumn(stats: data.stats!, filter: hpStat),
                const CustomVerticalDivider(),
                StatColumn(stats: data.stats!, filter: speedStat),
                const CustomVerticalDivider(),
                StatColumn(stats: data.stats!, filter: specialDefenceStat),
                const CustomVerticalDivider(),
                StatColumn(stats: data.stats!, filter: specialAttackStat),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

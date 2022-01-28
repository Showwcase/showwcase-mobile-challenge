import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/constants/constants.dart';
import 'package:flutter_challenge/src/home/domain/models/pokemon/pokemon.dart';
import 'package:flutter_challenge/src/home/widgets/custom_vertical_divider.dart';
import 'package:flutter_challenge/src/home/widgets/stat_column.dart';

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
              style:
                  Theme.of(context).textTheme.headline6?.copyWith(fontSize: 17),
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

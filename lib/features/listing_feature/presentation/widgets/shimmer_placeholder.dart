import 'package:flutter/material.dart';
import 'package:pokemon/config/constants.dart';
import 'package:pokemon/features/listing_feature/presentation/widgets/custom_vertical_divider.dart';
import 'package:pokemon/features/listing_feature/presentation/widgets/stat_row.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceholder extends StatelessWidget {
  const ShimmerPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 10.0,
                        color: Colors.white,
                        margin: const EdgeInsets.only(bottom: 8.0),
                      ),
                      Container(
                        width: 100.0,
                        height: 10.0,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StatRow(
                          icon: Icons.favorite_outline,
                          stats: [],
                          filter: hpStat,
                          color: Colors.redAccent,
                        ),
                        CustomVerticalDivider(),
                        StatRow(
                          icon: Icons.flash_auto,
                          stats: [],
                          filter: attackStat,
                          color: Colors.orangeAccent,
                        ),
                        CustomVerticalDivider(),
                        StatRow(
                          icon: Icons.shield_outlined,
                          stats: [],
                          filter: defenceStat,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

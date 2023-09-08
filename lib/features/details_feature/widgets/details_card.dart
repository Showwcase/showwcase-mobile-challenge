import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/config/screen_size_utility.dart';
import 'package:pokemon/config/widget_utility.dart';
import 'package:pokemon/features/details_feature/controllers/details_controller.dart';
import 'package:pokemon/features/details_feature/widgets/about_tab_view.dart';
import 'package:pokemon/features/details_feature/widgets/moves_tab_view.dart';
import 'package:pokemon/features/details_feature/widgets/stats_tab_view.dart';
import 'package:pokemon/features/listing_feature/data/models/pokemon/pokemon.dart';
import 'package:pokemon/features/listing_feature/presentation/widgets/tab_icon.dart';

class DetailsCard extends GetView<DetailsController> {
  const DetailsCard({super.key, required this.data});

  final Pokemon data;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: ScreenSize.height * 0.7,
        width: ScreenSize.width,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(40),
        ),
        child: GetBuilder<DetailsController>(
          id: 'detailsTabBuilder',
          builder: (_) {
            return DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  WidgetUtil.smallVSpacer,
                  Text(
                    data.name?.capitalizeFirst ?? '',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  WidgetUtil.smallVSpacer,
                  TabBar(
                    indicatorColor: Colors.transparent,
                    onTap: (index) {
                      controller.selectedTabIndex.value = index;
                      controller.update(['detailsTabBuilder']);
                    },
                    tabs: [
                      Tab(
                        child: TabIcon(
                          title: 'About',
                          isSelected: controller.selectedTabIndex.value == 0,
                        ),
                      ),
                      Tab(
                        child: TabIcon(
                          title: 'Stats',
                          isSelected: controller.selectedTabIndex.value == 1,
                        ),
                      ),
                      Tab(
                        child: TabIcon(
                          title: 'Moves',
                          isSelected: controller.selectedTabIndex.value == 2,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        AboutTabView(data: data),
                        StatsTabView(data: data),
                        MovesTabView(data: data),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

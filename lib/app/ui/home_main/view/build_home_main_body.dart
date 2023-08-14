import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:showwcase_flutter_challenge/app/core/model/data_model/pokemon_model.dart';
import 'package:showwcase_flutter_challenge/app/core/util/default_value.dart';
import 'package:showwcase_flutter_challenge/app/core/widget/build_card_list.dart';
import 'package:showwcase_flutter_challenge/app/ui/detail_page/controller/datail_page_controller.dart';
import 'package:showwcase_flutter_challenge/app/ui/home_main/controller/home_main_controller.dart';


/**
 *This class is to seprege Home main body clear
 * We will add all home main feature here
 */
class BuildHomeMainBody extends StatelessWidget {
  const BuildHomeMainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeMainController = Get.find<HomeMainController>();

    return Obx(
      () => SizedBox(
        height: double.infinity,
        child: SmartRefresher(
          enablePullDown: false,
          enablePullUp: true,
          controller: homeMainController.refreshController,
          onLoading: homeMainController.onLoad,
          child: homeMainController.pokemonList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: homeMainController.pokemonList.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, position) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed("/detail-page", arguments: [position]);
                      },
                      child: buildCardList(
                          context,
                          homeMainController.pokemonList[position],
                          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${2+position}.png",
                          position),
                    );
                  }),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:showwcase_flutter_challenge/app/ui/detail_page/controller/datail_page_controller.dart';

/**
 * This class is use to sepreate complex widget structure from detail page
 */
class BuildDetailPageWidget extends StatelessWidget {

  int position = Get.arguments[0];
   BuildDetailPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailPageController detailPageController =
        Get.find<DetailPageController>();

    return Center(
      child: Obx(
        () => detailPageController.isLoading.isTrue
            ? const CircularProgressIndicator()
            : SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      height: 150.h,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${2+position}.png",
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      ),
                    ),
                 
                    _detailTextWidget(
                        title: "Weight",
                        titleData: detailPageController
                            .pokemonDetailModel.weight
                            .toString()),
                    const Divider(),
                    _detailTextWidget(
                        title: "Height",
                        titleData: detailPageController
                            .pokemonDetailModel.height
                            .toString()),
                    const Divider(),
                    _detailTextWidget(
                        title: "Order",
                        titleData: detailPageController.pokemonDetailModel.order
                            .toString()),
                    const Divider(),
                    _detailTextWidget(
                        title: "Base Experience",
                        titleData: detailPageController
                            .pokemonDetailModel.baseExperience
                            .toString()),
                  ],
                ),
              ),
      ),
    );
  }
}


///This widget function is use to show pokemon detail

Widget _detailTextWidget({required String title, required String titleData}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [Text(title), Text(titleData)],
  );
}

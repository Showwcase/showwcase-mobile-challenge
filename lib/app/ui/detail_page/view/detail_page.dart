import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showwcase_flutter_challenge/app/core/widget/appbar/app_bar_with_back_icon.dart';
import 'package:showwcase_flutter_challenge/app/ui/detail_page/controller/datail_page_controller.dart';
import 'package:showwcase_flutter_challenge/app/ui/detail_page/view/build_detail_page_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int position = Get.arguments[0];

    DetailPageController mController = Get.find<DetailPageController>();
    mController.getPokemonDetail(2+position);

    return Scaffold(
      appBar: AppBarWithBackArrow(endIcon: Icons.notifications_none,title: "Detail Page",onClick: ()=>Get.back(),),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: BuildDetailPageWidget(),
      ),
    );
  }
}

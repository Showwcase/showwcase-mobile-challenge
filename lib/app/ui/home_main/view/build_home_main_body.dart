import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:showwcase_flutter_challenge/app/core/model/pokemon_model.dart';
import 'package:showwcase_flutter_challenge/app/core/util/default_value.dart';
import 'package:showwcase_flutter_challenge/app/ui/home_main/controller/home_main_controller.dart';

class BuildHomeMainBody extends StatelessWidget {
  const BuildHomeMainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeMainController = Get.find<HomeMainController>();
    return Obx(
      () => SizedBox(
        height: double.infinity,
        child: ListView.builder(
            itemCount: homeMainController.pokemonList.length,
            itemBuilder: (context, position) {
              return _buildCardList(context, homeMainController.pokemonList[position]);
            }),
      ),
    );
  }
}

Widget _buildCardList(
  context,
  Result result,
) {
  return Container(
    padding: const EdgeInsets.only(top: 8),
    child: Row(
      children: [
        Container(
            height: 50.h,
            width: 50.h,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.network(
                "https://cdn.pixabay.com/photo/2018/04/13/16/13/pixel-3316924_960_720.png")),

        const SizedBox(width: 8,),
        Text(result.name,style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontSize: dExtraLargeFontSize15.sp),)
      ],
    ),
  );
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:showwcase_flutter_challenge/app/core/model/data_model/pokemon_model.dart';
import 'package:showwcase_flutter_challenge/app/core/util/default_value.dart';


///This is reusable function for the text with image
Widget buildCardList(
    context,
    Result result,
    imgUrl,
    position
    ) {
  return Container(
    margin: const EdgeInsets.only(top: 2),
    padding: EdgeInsets.all(8),

    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [

        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 2,
          offset: Offset(0,2)
        )
      ],
      borderRadius: BorderRadius.circular(8)

    ),
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
            child: CachedNetworkImage(
              imageUrl :  imgUrl,
              placeholder: (context,url) => const CircularProgressIndicator(),
              errorWidget: (context,url,error) => const Icon(Icons.error,color: Colors.red,),
            )),
        const SizedBox(
          width: 8,
        ),
        Text(
          result.name,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: dExtraLargeFontSize15.sp),
        ),

      ],
    ),
  );
}
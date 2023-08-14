import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///This app bar will be use that will contain back arrow on app bar
class AppBarWithBackArrow extends StatelessWidget with PreferredSizeWidget {
  String title;
  IconData endIcon;
  Function onClick;

  AppBarWithBackArrow(
      {Key? key,
      required this.title,
      required this.onClick,
      required this.endIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text("$title"),
      leading: GestureDetector(
        onTap: () => onClick(),
        child: Icon(
          Icons.arrow_back_ios_sharp,
          size: 20.sp,
        ),
      ),
      actions: [
        SizedBox(
          width: 30,
          child: Stack(
            children: [
              Positioned(
                top: 2,
                bottom: 2,
                right: 4,
                child: Icon(endIcon, size: 28.sp, color: Colors.black),
              ),
              Positioned(
                bottom: 8,
                left: 4,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                    child: Text(
                      "5",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

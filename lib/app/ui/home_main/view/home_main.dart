import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:showwcase_flutter_challenge/app/core/widget/appbar/simple_app_bar.dart';
import 'package:showwcase_flutter_challenge/app/ui/home_main/view/build_home_main_body.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () {
        return  Scaffold(
          appBar: SimpleAppBar(title: "Home Page",onClick: ()=>print("hello world"), endIcon: Icons.notifications_none,),
          body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: BuildHomeMainBody(),
          ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add,color: Colors.white,size: 28.sp,),
        onPressed: () {  },),
        );
      }
    );
  }
}

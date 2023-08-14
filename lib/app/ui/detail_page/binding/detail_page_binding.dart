import 'package:get/get.dart';
import 'package:showwcase_flutter_challenge/app/core/repo/detail_repo/detail_repo.dart';
import 'package:showwcase_flutter_challenge/app/core/repo/home_repo/home_repo.dart';
import 'package:showwcase_flutter_challenge/app/ui/detail_page/controller/datail_page_controller.dart';
import 'package:showwcase_flutter_challenge/app/ui/home_main/controller/home_main_controller.dart';

class DetailPageBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => DetailPageController());
    Get.lazyPut(() => DetailRepo());
  }


}
import 'package:get/get.dart';
import 'package:showwcase_flutter_challenge/app/core/repo/home_repo/home_repo.dart';
import 'package:showwcase_flutter_challenge/app/ui/detail_page/controller/datail_page_controller.dart';
import 'package:showwcase_flutter_challenge/app/ui/home_main/controller/home_main_controller.dart';

class HomeMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeMainController());
    Get.lazyPut(() => HomeRepo());
    Get.lazyPut(() => DetailPageController());
  }


}
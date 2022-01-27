import 'package:get/get.dart';
import 'package:showwcase_flutter_challenge/app/ui/home_main/binding/home_main_binding.dart';
import 'package:showwcase_flutter_challenge/app/ui/home_main/controller/home_main_controller.dart';
import 'package:showwcase_flutter_challenge/app/ui/home_main/view/home_main.dart';

class PageRouter {

  var routes = [
    GetPage(
        name: '/',
        page: () => const HomeMain(),
        binding: HomeMainBinding()),
  ];

}
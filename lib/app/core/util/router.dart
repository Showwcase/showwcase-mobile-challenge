import 'package:get/get.dart';
import 'package:showwcase_flutter_challenge/app/ui/detail_page/binding/detail_page_binding.dart';
import 'package:showwcase_flutter_challenge/app/ui/detail_page/view/detail_page.dart';
import 'package:showwcase_flutter_challenge/app/ui/home_main/binding/home_main_binding.dart';
import 'package:showwcase_flutter_challenge/app/ui/home_main/controller/home_main_controller.dart';
import 'package:showwcase_flutter_challenge/app/ui/home_main/view/home_main.dart';

///This class is for the Page routes
///And all widget pages must declare here
class PageRouter {
  var routes = [
    GetPage(
        name: '/', page: () => const HomeMain(), binding: HomeMainBinding()),
    GetPage(
        name: '/detail-page',
        page: () => const DetailPage(),
        binding: DetailPageBinding()),
  ];
}

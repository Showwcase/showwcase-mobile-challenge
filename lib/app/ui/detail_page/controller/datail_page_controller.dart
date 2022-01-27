import 'package:get/get.dart';
import 'package:showwcase_flutter_challenge/app/core/model/data_model/PokemonDetailModel.dart';
import 'package:showwcase_flutter_challenge/app/core/model/service_model/http_get_result.dart';
import 'package:showwcase_flutter_challenge/app/core/repo/detail_repo/detail_repo.dart';
import 'package:showwcase_flutter_challenge/app/core/repo/home_repo/home_repo.dart';
import 'package:showwcase_flutter_challenge/app/ui/home_main/controller/home_main_controller.dart';
import 'package:showwcase_flutter_challenge/app/ui/home_main/view/home_main.dart';


/**
 *All Business login for Detail Page
 */
class DetailPageController extends GetxController {

 late PokemonDetailModel pokemonDetailModel ;
 late DetailRepo _detailRepo;

 RxBool isLoading = true.obs;
  DetailPageController() {
    _detailRepo = Get.find<DetailRepo>();
  }
  Future<void> getPokemonDetail(int id) async {


    isLoading.value = true;
    HttpGetResult<PokemonDetailModel> pokemonDetail =
    await _detailRepo.getPokemonDetail(id: id);
    pokemonDetailModel = pokemonDetail.mData;
    isLoading.value = false;

    print(pokemonDetailModel.name);
  }
}
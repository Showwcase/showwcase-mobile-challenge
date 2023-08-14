import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:showwcase_flutter_challenge/app/core/model/service_model/http_get_result.dart';
import 'package:showwcase_flutter_challenge/app/core/model/data_model/pokemon_model.dart';
import 'package:showwcase_flutter_challenge/app/core/repo/home_repo/home_repo.dart';

/**
 * All Business logic for Home Main will be write here
 */
class HomeMainController extends GetxController {
  RxList<Result> pokemonList = RxList();
  RxInt page = 1.obs;
  late HomeRepo _homeRepo;
  late RxInt selectedIndex;
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  HomeMainController() {
    _homeRepo = Get.put(HomeRepo());
    getPokemonData(page.value);
  }

  /**
   * this method will get data from api
   */
  Future<void> getPokemonData(int page) async {
    HttpGetResult<PokemonModel> pokeListFromServer =
        await _homeRepo.getPokemonData(page: page);
    pokemonList.addAll(pokeListFromServer.mData.results);
  }

  /***
   * this is for pagigation to load when the list data got end
   * this will will new data to old list
   */
  void onLoad() async {
    page.value++;
    await getPokemonData(page.value);
    // if failed,use refreshFailed()
    refreshController.loadComplete();
  }
}

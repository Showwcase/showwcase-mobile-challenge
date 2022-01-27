import 'package:get/get.dart';
import 'package:showwcase_flutter_challenge/app/core/model/http_get_result.dart';
import 'package:showwcase_flutter_challenge/app/core/model/pokemon_model.dart';
import 'package:showwcase_flutter_challenge/app/core/repo/home_repo/home_repo.dart';

class HomeMainController extends GetxController {
  RxList<Result> pokemonList = RxList();
  late HomeRepo _homeRepo;

  HomeMainController() {
    _homeRepo = Get.put(HomeRepo());
    getPokemonData();
  }

  getPokemonData() async {
    HttpGetResult<PokemonModel> pokeListFromServer =
        await _homeRepo.getPokemonData(page: 20);

    pokemonList.addAll(pokeListFromServer.mData.results);
    print(pokemonList.length);
  }
}

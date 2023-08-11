import 'dart:convert';

import 'package:get/get.dart';
import 'package:showwcase_flutter_challenge/app/core/model/service_model/http_get_result.dart';
import 'package:showwcase_flutter_challenge/app/core/model/data_model/pokemon_model.dart';
import 'package:showwcase_flutter_challenge/app/core/model/service_model/response_http_data.dart';
import 'package:showwcase_flutter_challenge/app/service/http_service.dart';


///this class will be use to get data from api service and contert to object for the home controller
class HomeRepo {
  late HttpService _httpService;

  HomeRepo() {
    _httpService = Get.put(HttpService());
  }

  Future<HttpGetResult<PokemonModel>> getPokemonData({page}) async {
    ResponseHttpData result =
        await _httpService.getData("pokemon?limit=30&offset=$page");
    if (result.isSuccessful) {
      PokemonModel pokemonData = pokemonModelFromJson(result.mData);
      return HttpGetResult("", 200, pokemonData, true);
    } else {
      return HttpGetResult(
          result.errorMessage,
          result.stateCode,
          PokemonModel(next: 'null', results: [], previous: '', count: -1),
          false);
    }
  }

}

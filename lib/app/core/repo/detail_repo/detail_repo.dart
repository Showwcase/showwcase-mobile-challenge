import 'package:get/get.dart';
import 'package:showwcase_flutter_challenge/app/core/model/data_model/PokemonDetailModel.dart';
import 'package:showwcase_flutter_challenge/app/core/model/service_model/http_get_result.dart';
import 'package:showwcase_flutter_challenge/app/core/model/service_model/response_http_data.dart';
import 'package:showwcase_flutter_challenge/app/service/http_service.dart';


///this class will be use to get data from api service and contert to object for the detail controller
class DetailRepo {
  late HttpService _httpService;

  DetailRepo() {
    _httpService = Get.put(HttpService());
  }



  Future<HttpGetResult<PokemonDetailModel>> getPokemonDetail({id}) async {
    ResponseHttpData result = await _httpService.getData("pokemon/$id");
    if (result.isSuccessful) {
      PokemonDetailModel pokemonDetal =
      pokemonDetailModelFromJson(result.mData);
      return HttpGetResult("", 200, pokemonDetal, true);
    } else {
      return HttpGetResult(
          result.errorMessage,
          result.stateCode,
          PokemonDetailModel(
              id: -1,
              height: -1,
              baseExperience: -1,
              locationAreaEncounters: '',
              isDefault: false,
              weight: -1,
              order: -1,
              name: ''),
          false);
    }
  }
}

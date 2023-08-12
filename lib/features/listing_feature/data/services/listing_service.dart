import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pokemon/config/constants.dart';
import 'package:pokemon/core/utils/environment_util.dart';
import 'package:pokemon/core/utils/logger_util.dart';
import 'package:pokemon/core/utils/response_util.dart';
import 'package:pokemon/features/listing_feature/data/models/pokemon/pokemon.dart';
import 'package:pokemon/features/listing_feature/data/models/pokemon_response.dart';

class ListingService {
  /// Simulated method for adding a new pokemon
  ///
  Future addPokemon(newPokemon) async {
    await Future.delayed(const Duration(seconds: 2));

    return Pokemon(
      id: 78129,
      types: [],
      height: 0,
      weight: 0,
      name: 'New Pokemon',
    );
  }

  /// Fetch pokemons from a specified offset
  ///
  /// > params: (optional) [int] __offset__ : The offset from where to fetch the pokemons.
  ///
  Future getPokemons({int offset = 0}) async {
    final url = Uri.parse(
        "${EnvironmentUtil.kApiUrl}pokemon?limit=$fetchLimit&offset=$offset");

    try {
      final response = await http.get(url);

      var resp = responseHandler(response);

      return PokemonResponse.fromJson(resp);
    } on SocketException {
      return Exception('No internet connection');
    } catch (err) {
      Logger.logError(err.toString());
      return err;
    }
  }

  /// Fetch pokemon details using a specified name.
  ///
  /// > params: (required) [String] __name__ : The name of the pokemon.
  ///
  Future getPokemonByName(String name) async {
    final url = Uri.parse("${EnvironmentUtil.kApiUrl}pokemon/$name");

    Logger.logInfo(url.toString());
    try {
      final response = await http.get(url);

      var resp = responseHandler(response);

      if (resp is Map) {
        return true;
      } else {
        return false;
      }
    } on SocketException {
      return false;
    } catch (err) {
      Logger.logError(err.toString());
      return false;
    }
  }

  /// Fetch pokemon details from a url
  ///
  /// > params: (required) [string] __url__ : The url for the specific pokemon.
  ///
  Future getPokemonFromUrl(String url) async {
    final kurl = Uri.parse(url);

    try {
      final response = await http.get(kurl);

      var resp = responseHandler(response);

      return Pokemon.fromJson(resp);
    } on SocketException {
      return Exception('No internet connection');
    } catch (err) {
      Logger.logError(err.toString());
      return err;
    }
  }
}

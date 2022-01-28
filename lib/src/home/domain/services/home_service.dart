import 'dart:developer' show log;
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:flutter_challenge/src/constants/constants.dart';
import 'package:flutter_challenge/src/constants/urls.dart';
import 'package:flutter_challenge/src/home/domain/models/pokemon/pokemon.dart';
import 'package:flutter_challenge/src/home/domain/models/pokemon_response.dart';
import 'package:flutter_challenge/src/home/domain/repository/home_repo_impl.dart';
import 'package:flutter_challenge/src/shared/models/custom_exception.dart';
import 'package:flutter_challenge/src/shared/services/response_handler.dart';

class HomeService implements HomeRepoImpl {
  @override
  Future addPokemon(newPokemon) async {
    await Future.delayed(const Duration(seconds: 3));

    return Pokemon(
      id: 9999,
      name: 'Dummy Pokemon',
    );
  }

  @override
  Future fetchPaginatedPokemon({int offset = 0}) async {
    final url = Uri.parse(baseUrl + "pokemon?limit=$fetchLimit&offset=$offset");

    try {
      final response = await http.get(url);

      var resp = responseHandler(response);

      return PokemonResponse.fromJson(resp);
    } on SocketException {
      return FetchDataException('No internet connection');
    }

    // catch error
    catch (err) {
      log(err.toString(), level: 2);
      return err;
    }
  }

  @override
  Future getPokemonById(int id) async {
    final url = Uri.parse(baseUrl + "pokemon/$id");

    try {
      final response = await http.get(url);

      var resp = responseHandler(response);

      return Pokemon.fromJson(resp);
    } on SocketException {
      return FetchDataException('No internet connection');
    }

    // catch error
    catch (err) {
      return err;
    }
  }

  @override
  Future getPokemonFromUrl(String url) async {
    final _url = Uri.parse(url);

    try {
      final response = await http.get(_url);

      var resp = responseHandler(response);

      return Pokemon.fromJson(resp);
    } on SocketException {
      return FetchDataException('No internet connection');
    }

    // catch error
    catch (err) {
      return err;
    }
  }
}

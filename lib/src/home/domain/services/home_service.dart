import 'package:flutter_challenge/src/home/domain/models/pokemon_response.dart';
import 'package:flutter_challenge/src/home/domain/models/pokemon/pokemon.dart';
import 'package:flutter_challenge/src/home/domain/repository/home_repo_impl.dart';

class HomeService implements HomeRepoImpl {
  @override
  Future addPokemon(newPokemon) async {
    // TODO: implement addPokemon
    throw UnimplementedError();
  }

  @override
  Future<PokemonResponse?> fetchPaginatedPokemon(int limit,
      {int offset = 0}) async {
    // TODO: implement fetchPaginatedPokemon
    throw UnimplementedError();
  }

  @override
  Future<Pokemon?> getPokemonById(int id) async {
    // TODO: implement getPokemonById
    throw UnimplementedError();
  }
}

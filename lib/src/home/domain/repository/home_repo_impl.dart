import 'package:flutter_challenge/src/home/domain/models/pokemon/pokemon.dart';
import 'package:flutter_challenge/src/home/domain/models/pokemon_response.dart';

abstract class HomeRepoImpl {
  /// fetch all available pokemons via pagination
  Future<PokemonResponse?> fetchPaginatedPokemon(int limit,
      {int offset = 0}) async {}

  Future addPokemon(var newPokemon) async {}

  Future<Pokemon?> getPokemonById(int id) async {}
}

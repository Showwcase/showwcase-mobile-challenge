abstract class HomeRepoImpl {
  /// fetch all available pokemons via pagination
  Future fetchPaginatedPokemon({int offset = 0});

  Future addPokemon(var newPokemon);

  Future getPokemonById(int id);

  Future getPokemonFromUrl(String url);
}

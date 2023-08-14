import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/config/constants.dart';
import 'package:pokemon/core/utils/environment_util.dart';
import 'package:pokemon/features/details_feature/screens/pokemon_details_page.dart';
import 'package:pokemon/features/listing_feature/data/models/pokemon_response.dart';
import 'package:pokemon/features/listing_feature/data/models/pokemon_response_result.dart';
import 'package:pokemon/features/listing_feature/data/services/listing_service.dart';

class PokemonListingController extends GetxController {
  final _listingService = ListingService();
  late ScrollController scrollController;

  TextEditingController searchController = TextEditingController();

  int page = 0;

  RxBool hasMore = true.obs;
  RxBool isSearching = false.obs;
  RxBool isPrePopulate = false.obs;
  RxBool isLoadingMore = false.obs;
  RxBool noSearchResult = false.obs;

  List<PokemonResponseResult?> likedPokemons = <PokemonResponseResult?>[].obs;
  List<PokemonResponseResult?> pokemons = <PokemonResponseResult?>[].obs;

  /// Load more pokemon data when user scrolls to the bottom of the list
  ///
  void _loadMore() async {
    if (hasMore.value == true &&
        isPrePopulate.value == false &&
        isLoadingMore.value == false &&
        scrollController.position.extentAfter < 300) {
      isLoadingMore.value = true;

      page += fetchLimit;

      var response = await _listingService.getPokemons(offset: page);

      if (response is PokemonResponse) {
        final fetchedData = response.results ?? [];

        if (fetchedData.isNotEmpty) {
          pokemons.addAll(response.results ?? []);
        } else {
          hasMore.value = false;
        }
      } else {
        final ArgumentError err = response;

        Get.snackbar('Error', err.toString());
      }

      isLoadingMore.value = false;
    }
  }

  /// Fecth pokemons from the API without an offset
  ///
  void prePopulate() async {
    isPrePopulate.value = true;

    var response = await _listingService.getPokemons(offset: page);

    if (response is PokemonResponse) {
      pokemons = response.results ?? const [];
    } else {
      Get.snackbar('Error', response.message.toString());
    }

    isPrePopulate.value = false;
  }

  /// Search for a pokemon using its name
  ///
  void searchPokemon(String searchQuery) async {
    page = 0;
    pokemons.clear();
    var response = await _listingService.getPokemonByName(searchQuery);

    if (response) {
      noSearchResult.value = false;
      isSearching.value = false;
      Get.back();
      Get.to(
        () => PokemonDetailsPage(
          params: {"url": '${EnvironmentUtil.kApiUrl}pokemon/$searchQuery'},
        ),
      );
    } else {
      noSearchResult.value = true;
    }

    isPrePopulate.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    prePopulate();
    scrollController = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    scrollController.removeListener(_loadMore);
    scrollController.dispose();
    super.dispose();
  }
}

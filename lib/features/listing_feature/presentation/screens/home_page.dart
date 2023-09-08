import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/config/color_pallete.dart';
import 'package:pokemon/features/add_feature/screens/add_pokemon_page.dart';
import 'package:pokemon/features/favourites_feature/screens/favourite_page.dart';
import 'package:pokemon/features/listing_feature/presentation/controllers/pokemon_listing_controller.dart';
import 'package:pokemon/features/listing_feature/presentation/widgets/pokemon_listing.dart';
import 'package:pokemon/features/listing_feature/presentation/widgets/favourite_counter.dart';
import 'package:pokemon/features/listing_feature/presentation/widgets/search_dialog.dart';

class HomePage extends GetView<PokemonListingController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.backgroundColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => const AddPokemonPage());
        },
        tooltip: 'add new pokemon',
        backgroundColor: ColorPallete.secondaryColor,
        label: const Text(
          'Add Pokemon',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: ColorPallete.backgroundColor,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Pokemon World',
          style: TextStyle(
            color: ColorPallete.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                Get.dialog(
                  const SearchDialog(),
                );
              },
              child: const Icon(
                Icons.search,
                color: ColorPallete.primaryTextColor,
                size: 32,
              ),
            ),
          ),
          GetBuilder<PokemonListingController>(
            id: 'FavouriteCounterBuilder',
            builder: (_) {
              return GestureDetector(
                onTap: () {
                  Get.to(
                    () => FavoritesPage(
                        params: {'data': controller.likedPokemons}),
                  );
                },
                child: FavouriteCounter(
                    value: controller.likedPokemons.length.toString()),
              );
            },
          )
        ],
      ),
      body: Obx(
        () => controller.isPrePopulate.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorPallete.primaryColor,
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        controller.likedPokemons.clear();
                        controller.prePopulate();
                      },
                      child: GetBuilder<PokemonListingController>(
                        id: 'pokemonListBuilder',
                        builder: (_) {
                          return PokemonListing(
                            controller: controller.scrollController,
                            favoritePokemons: controller.likedPokemons,
                            pokemons: controller.pokemons,
                            callback: () {
                              controller.update(
                                [
                                  'pokemonListBuilder',
                                  'FavouriteCounterBuilder'
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),

                  // when the _loadMore function is running
                  if (controller.isLoadingMore.value == true)
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 40),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: ColorPallete.primaryColor,
                        ),
                      ),
                    ),

                  // When nothing else to load
                  if (controller.hasMore.value == false)
                    Container(
                      padding: const EdgeInsets.only(top: 30, bottom: 40),
                      color: Colors.amber,
                      child: const Center(
                        child: Text('No more available data'),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}

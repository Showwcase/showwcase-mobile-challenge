import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/config/color_pallete.dart';
import 'package:pokemon/config/constants.dart';
import 'package:pokemon/features/listing_feature/data/models/pokemon/pokemon.dart';
import 'package:pokemon/features/listing_feature/data/models/pokemon_response_result.dart';
import 'package:pokemon/features/listing_feature/data/services/listing_service.dart';
import 'package:pokemon/features/details_feature/screens/pokemon_details_page.dart';
import 'package:pokemon/features/listing_feature/presentation/widgets/shimmer_placeholder.dart';
import 'custom_vertical_divider.dart';
import 'stat_row.dart';

class PokemonListing extends StatelessWidget {
  PokemonListing({
    Key? key,
    this.controller,
    this.pokemons = const [],
    this.favoritePokemons = const [],
    this.showLikeButton = true,
    required this.callback,
  }) : super(key: key);

  final ScrollController? controller;
  final List<PokemonResponseResult?> pokemons;
  final List<PokemonResponseResult?> favoritePokemons;
  final bool showLikeButton;
  final Function() callback;

  final _listingService = ListingService();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      itemCount: pokemons.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) {
        final PokemonResponseResult result = pokemons[index]!;

        return GestureDetector(
          onTap: () {
            Get.to(() => PokemonDetailsPage(params: {"url": result.url}));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorPallete.lightGreyColor.withOpacity(0.5),
                  blurRadius: 4,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: FutureBuilder(
              future: _listingService.getPokemonFromUrl(result.url!),
              builder: (context, res) {
                if (res.hasData) {
                  final data = res.data;

                  if (data is Pokemon) {
                    String? img = data.sprites?.frontDefault;

                    return Column(
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Colors.white,
                                ColorPallete.backgroundColor,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(img!),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: showLikeButton
                                ? IconButton(
                                    icon: favoritePokemons.contains(result)
                                        ? const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )
                                        : const Icon(
                                            Icons.favorite_outline,
                                            color: ColorPallete.lightGreyColor,
                                          ),
                                    onPressed: () {
                                      if (favoritePokemons.contains(result)) {
                                        favoritePokemons.remove(result);
                                      } else {
                                        favoritePokemons.add(result);
                                      }

                                      callback();
                                    },
                                  )
                                : Container(),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  result.name?.capitalizeFirst ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontSize: 17),
                                ),
                                SizedBox(
                                  height: 25,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      StatRow(
                                        icon: Icons.favorite_outline,
                                        stats: data.stats!,
                                        filter: hpStat,
                                        color: Colors.redAccent,
                                      ),
                                      const CustomVerticalDivider(),
                                      StatRow(
                                        icon: Icons.flash_auto,
                                        stats: data.stats!,
                                        filter: attackStat,
                                        color: Colors.orangeAccent,
                                      ),
                                      const CustomVerticalDivider(),
                                      StatRow(
                                        icon: Icons.shield_outlined,
                                        stats: data.stats!,
                                        filter: defenceStat,
                                        color: Colors.green,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                } else {
                  return const ShimmerPlaceholder();
                }
              },
            ),
          ),
        );
      },
    );
  }
}

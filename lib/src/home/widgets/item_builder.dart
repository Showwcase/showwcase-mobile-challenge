import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/constants/app_routes.dart';
import 'package:flutter_challenge/src/constants/constants.dart';
import 'package:flutter_challenge/src/home/domain/models/pokemon/pokemon.dart';
import 'package:flutter_challenge/src/home/domain/models/pokemon_response_result.dart';
import 'package:flutter_challenge/src/home/domain/services/home_service.dart';

import 'custom_vertical_divider.dart';
import 'stat_row.dart';

class ItemBuilder extends StatelessWidget {
  ItemBuilder({
    Key? key,
    this.controller,
    this.pokemons = const [],
    this.likedPokemons = const [],
    this.showLikeButton = true,
    required this.callback,
  }) : super(key: key);

  final ScrollController? controller;
  final List<PokemonResponseResult?> pokemons;
  final List<PokemonResponseResult?> likedPokemons;
  final bool showLikeButton;
  Function() callback;

  final _homeService = HomeService();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: pokemons.length,
      itemBuilder: (_, index) {
        final PokemonResponseResult result = pokemons[index]!;

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, detailScreen,
                arguments: {"url": result.url});
          },
          child: Card(
            elevation: 8,
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 10,
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              height: 100,
              child: FutureBuilder(
                future: _homeService.getPokemonFromUrl(result.url!),
                builder: (context, res) {
                  if (res.hasData) {
                    final data = res.data;

                    // log(result.toString());

                    if (data is Pokemon) {
                      String? img = data.sprites?.frontDefault;

                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                Theme.of(context).primaryColor.withOpacity(0.6),
                            backgroundImage: NetworkImage(img!),
                            maxRadius: 40,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                result.name!,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(fontSize: 17),
                              ),
                              Container(
                                height: 25,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    StatRow(
                                      icon: Icons.science,
                                      stats: data.stats!,
                                      filter: hpStat,
                                    ),
                                    const CustomVerticalDivider(),
                                    StatRow(
                                      icon: Icons.offline_bolt,
                                      stats: data.stats!,
                                      filter: attackStat,
                                    ),
                                    const CustomVerticalDivider(),
                                    StatRow(
                                      icon: Icons.speed,
                                      stats: data.stats!,
                                      filter: speedStat,
                                    ),
                                    const CustomVerticalDivider(),
                                    StatRow(
                                      icon: Icons.security,
                                      stats: data.stats!,
                                      filter: defenceStat,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          showLikeButton
                              ? Center(
                                  child: IconButton(
                                    icon: likedPokemons.contains(result)
                                        ? Icon(
                                            Icons.favorite,
                                            color:
                                                Theme.of(context).primaryColor,
                                          )
                                        : const Icon(Icons.favorite_outline),
                                    onPressed: () {
                                      if (likedPokemons.contains(result)) {
                                        likedPokemons.remove(result);
                                      } else {
                                        likedPokemons.add(result);
                                      }

                                      callback();
                                    },
                                  ),
                                )
                              : Container(),
                        ],
                      );
                    }

                    // error
                    else {
                      return Container();
                    }
                  }

                  // loading state
                  else {
                    return const Center(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: LinearProgressIndicator(
                          backgroundColor: Colors.white),
                    ));
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

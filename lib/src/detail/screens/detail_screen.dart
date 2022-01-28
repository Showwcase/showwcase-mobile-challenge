import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/detail/widgets/item_detail.dart';
import 'package:flutter_challenge/src/detail/widgets/stats_card.dart';
import 'package:flutter_challenge/src/home/domain/models/pokemon/pokemon.dart';
import 'package:flutter_challenge/src/home/domain/services/home_service.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.arguments}) : super(key: key);

  final Map<String, dynamic> arguments;

  final _homeService = HomeService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Details')),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: _homeService.getPokemonFromUrl(arguments['url']),
            builder: (context, res) {
              if (res.hasData) {
                final data = res.data;

                if (data is Pokemon) {
                  String? img =
                      data.sprites?.other?.officialArtwork?.frontDefault;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Image.network(
                          img!,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            data.name!.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(fontSize: 27),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text(
                          'Abilities',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(fontSize: 17),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Wrap(
                          spacing: 20,
                          children: data.abilities!
                              .map((e) => Chip(label: Text(e.ability!.name!)))
                              .toList(),
                        ),
                      ),
                      ItemDetail(
                        title: 'Weight',
                        value: data.weight.toString(),
                      ),
                      ItemDetail(
                        title: 'Height',
                        value: data.height.toString(),
                      ),
                      ItemDetail(
                        title: 'XP',
                        value: data.baseExperience.toString(),
                      ),
                      StatsCard(data: data),
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
                  padding: EdgeInsets.symmetric(vertical: 100),
                  child: CircularProgressIndicator(),
                ));
              }
            },
          ),
        ),
      ),
    );
  }
}

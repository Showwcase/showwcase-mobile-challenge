import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/constants/constants.dart';
import 'package:flutter_challenge/src/home/domain/models/pokemon/pokemon.dart';
import 'package:flutter_challenge/src/home/domain/models/pokemon_response.dart';
import 'package:flutter_challenge/src/home/domain/models/pokemon_response_result.dart';
import 'package:flutter_challenge/src/home/domain/services/home_service.dart';
import 'package:flutter_challenge/src/shared/models/custom_exception.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeService = HomeService();

  // page offset
  int _page = 0;

  bool _hasMore = true;

  bool _isInitialLoad = false;

  bool _isLoadingMore = false;

  // holds the pokemon data fetched from api backend
  List<PokemonResponseResult?> _pokemons = [];

  SnackBar snackBar(String message, Color color) =>
      SnackBar(content: Text(message), backgroundColor: color);

  void initialLoad() async {
    setState(() {
      _isInitialLoad = true;
    });

    var response = await _homeService.fetchPaginatedPokemon(offset: _page);

    if (response is PokemonResponse) {
      setState(() {
        _pokemons = response.results ?? const [];
      });
    } else {
      // error returned as CustomException base class
      final CustomException err = response;

      ScaffoldMessenger.of(context).showSnackBar(
        snackBar(err.toString(), Colors.red),
      );
    }

    setState(() {
      _isInitialLoad = false;
    });
  }

  void _loadMore() async {
    if (_hasMore == true &&
        _isInitialLoad == false &&
        _isLoadingMore == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadingMore = true;
      });

      _page += fetchLimit;

      var response = await _homeService.fetchPaginatedPokemon(offset: _page);

      if (response is PokemonResponse) {
        final fetchedData = response.results ?? [];

        if (fetchedData.isNotEmpty) {
          setState(() {
            _pokemons.addAll(response.results ?? []);
          });
        } else {
          setState(() {
            _hasMore = false;
          });
        }
      } else {
        // error returned as CustomException base class
        final CustomException err = response;

        ScaffoldMessenger.of(context).showSnackBar(
          snackBar(err.toString(), Colors.red),
        );
      }

      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    initialLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        tooltip: 'add new pokemon',
      ),
      appBar: AppBar(
        title: const Text('Pokemon App'),
      ),
      body: _isInitialLoad
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      initialLoad();
                    },
                    child: ListView.builder(
                      controller: _controller,
                      itemCount: _pokemons.length,
                      itemBuilder: (_, index) {
                        final PokemonResponseResult result = _pokemons[index]!;

                        return Card(
                          elevation: 8,
                          margin: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 10,
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            height: 100,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FutureBuilder(
                                  future: _homeService
                                      .getPokemonFromUrl(result.url!),
                                  builder: (context, result) {
                                    if (result.hasData) {
                                      final data = result.data;

                                      log(result.toString());

                                      if (data is Pokemon) {
                                        // String? img = data.sprites?.other?.officialArtwork!.frontDefault;
                                        String? img =
                                            data.sprites?.frontDefault;

                                        return CircleAvatar(
                                          backgroundColor: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.6),
                                          backgroundImage: NetworkImage(img!),
                                          maxRadius: 40,
                                        );
                                      }

                                      // error
                                      else {
                                        return CircleAvatar(
                                          backgroundColor: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.6),
                                          child: const Text('PA'),
                                        );
                                      }
                                    }

                                    // loading state
                                    else {
                                      return const Center(
                                          child: CircularProgressIndicator(
                                              backgroundColor: Colors.white));
                                    }
                                  },
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(result.name!),
                                    Text(result.url!),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // when the _loadMore function is running
                if (_isLoadingMore == true)
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 40),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),

                // When nothing else to load
                if (_hasMore == false)
                  Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 40),
                    color: Colors.amber,
                    child: const Center(
                      child: Text('No more available data'),
                    ),
                  ),
              ],
            ),
    );
  }
}

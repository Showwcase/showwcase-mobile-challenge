import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/constants/app_routes.dart';
import 'package:flutter_challenge/src/constants/constants.dart';
import 'package:flutter_challenge/src/home/domain/models/pokemon_response.dart';
import 'package:flutter_challenge/src/home/domain/models/pokemon_response_result.dart';
import 'package:flutter_challenge/src/home/domain/services/home_service.dart';
import 'package:flutter_challenge/src/home/widgets/item_builder.dart';
import 'package:flutter_challenge/src/home/widgets/like_badge.dart';
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

  /// hold user favorites
  List<PokemonResponseResult?> _likedPokemons = [];

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
        onPressed: () {
          Navigator.pushNamed(context, addScreen);
        },
        child: const Icon(Icons.add),
        tooltip: 'add new pokemon',
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Pokemon App'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, favScreen,
                  arguments: {'data': _likedPokemons});
            },
            child: LikeBadge(value: _likedPokemons.length.toString()),
          )
        ],
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
                      _likedPokemons.clear();
                      setState(() {});
                      initialLoad();
                    },
                    child: ItemBuilder(
                      controller: _controller,
                      likedPokemons: _likedPokemons,
                      pokemons: _pokemons,
                      callback: () {
                        setState(() {});
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

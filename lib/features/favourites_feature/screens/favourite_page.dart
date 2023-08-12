import 'package:flutter/material.dart';
import 'package:pokemon/config/color_pallete.dart';
import 'package:pokemon/features/listing_feature/presentation/widgets/pokemon_listing.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key, required this.params}) : super(key: key);

  final Map<String, dynamic> params;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorPallete.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Favorite Pokemons',
          style: TextStyle(
            color: ColorPallete.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: params['data'].isEmpty
                  ? Center(
                      child: Text(
                      'Your liked pokemons will appear here.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontStyle: FontStyle.italic, color: Colors.grey),
                    ))
                  : PokemonListing(
                      pokemons: params['data'],
                      showLikeButton: false,
                      callback: () {},
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

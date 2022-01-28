import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/home/widgets/item_builder.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key, required this.args}) : super(key: key);

  final Map<String, dynamic> args;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorites Pokemon'),
        ),
        body: Column(
          children: [
            Expanded(
              child: args['data'].isEmpty
                  ? Center(
                      child: Text(
                      'you dont have any favorite pokemons yet',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontStyle: FontStyle.italic, color: Colors.grey),
                    ))
                  : ItemBuilder(
                      pokemons: args['data'],
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

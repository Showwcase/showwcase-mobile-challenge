import 'package:flutter/material.dart';
import 'package:pokemon/core/utils/environment_util.dart';
import 'package:pokemon/pokemon.dart';

void main() async {
  // * Load the environment variables.
  await EnvironmentUtil.init();

  runApp(const PokemonApp());
}

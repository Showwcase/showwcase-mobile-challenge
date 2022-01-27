import 'package:meta/meta.dart';
import 'dart:convert';

PokemonDetailModel pokemonDetailModelFromJson(String str) =>
    PokemonDetailModel.fromJson(json.decode(str));

String pokemonDetailModelToJson(PokemonDetailModel data) =>
    json.encode(data.toJson());

class PokemonDetailModel {
  PokemonDetailModel({
    required this.baseExperience,
    required this.height,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.name,
    required this.order,
    required this.weight,
  });

  int baseExperience;
  int height;
  int id;
  bool isDefault;
  String locationAreaEncounters;
  String name;
  int order;
  int weight;

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) =>
      PokemonDetailModel(
        baseExperience: json["base_experience"],
        height: json["height"],
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        name: json["name"],
        order: json["order"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "base_experience": baseExperience,
        "height": height,
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "name": name,
        "order": order,
        "weight": weight,
      };
}

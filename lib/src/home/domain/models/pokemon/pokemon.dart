import '../base_name_url.dart';
import 'ability.dart';
import 'move.dart';
import 'pokemon_type.dart';
import 'sprite.dart';
import 'stat.dart';

class Pokemon {
  Pokemon({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.height,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  final List<Ability>? abilities;
  final int? baseExperience;
  final List<NameUrlCommonRespond>? forms;
  final int? height;
  final int? id;
  final bool? isDefault;
  final String? locationAreaEncounters;
  final List<Move>? moves;
  final String? name;
  final int? order;
  final NameUrlCommonRespond? species;
  final Sprites? sprites;
  final List<Stat>? stats;
  final List<PokemonType>? types;
  final int? weight;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
        baseExperience: json["base_experience"],
        height: json["height"],
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
        name: json["name"],
        order: json["order"],
        species: NameUrlCommonRespond.fromJson(json["species"]),
        sprites: Sprites.fromJson(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<PokemonType>.from(
            json["types"].map((x) => PokemonType.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": abilities == null
            ? const []
            : List<Ability>.from(abilities!.map((x) => x.toJson())),
        "base_experience": baseExperience,
        "forms": forms == null
            ? const []
            : List<NameUrlCommonRespond>.from(forms!.map((x) => x.toJson())),
        "height": height,
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": moves == null
            ? const []
            : List<Move>.from(moves!.map((x) => x.toJson())),
        "name": name,
        "order": order,
        "species": species?.toJson(),
        "sprites": sprites?.toJson(),
        "stats": stats == null
            ? const []
            : List<Stat>.from(stats!.map((x) => x.toJson())),
        "types": types == null
            ? const []
            : List<PokemonType>.from(types!.map((x) => x.toJson())),
        "weight": weight,
      };
}

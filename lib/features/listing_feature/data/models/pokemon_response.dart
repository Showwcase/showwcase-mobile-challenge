import 'dart:convert';

import 'pokemon_response_result.dart';

class PokemonResponse {
  PokemonResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  final int? count;
  final String? next;
  final String? previous;
  final List<PokemonResponseResult>? results;

  factory PokemonResponse.fromRawJson(String str) =>
      PokemonResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      PokemonResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PokemonResponseResult>.from(
            json["results"].map((x) => PokemonResponseResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? const []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

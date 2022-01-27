import 'dart:convert';

class PokemonResponseResult {
  PokemonResponseResult({
    this.name,
    this.url,
  });

  final String? name;
  final String? url;

  factory PokemonResponseResult.fromRawJson(String str) =>
      PokemonResponseResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PokemonResponseResult.fromJson(Map<String, dynamic> json) =>
      PokemonResponseResult(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

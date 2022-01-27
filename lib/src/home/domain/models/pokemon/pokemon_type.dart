import '../base_name_url.dart';

class PokemonType {
  PokemonType({
    this.slot,
    this.type,
  });

  final int? slot;
  final NameUrlCommonRespond? type;

  factory PokemonType.fromJson(Map<String, dynamic> json) => PokemonType(
        slot: json["slot"],
        type: NameUrlCommonRespond.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {"slot": slot, "type": type?.toJson()};
}

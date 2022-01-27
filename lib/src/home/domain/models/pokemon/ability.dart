import '../base_name_url.dart';

class Ability {
  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  final NameUrlCommonRespond? ability;
  final bool? isHidden;
  final int? slot;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: NameUrlCommonRespond.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability?.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

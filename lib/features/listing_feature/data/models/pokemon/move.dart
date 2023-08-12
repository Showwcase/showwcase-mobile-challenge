import '../base_name_url.dart';

class Move {
  Move({
    this.move,
    this.versionGroupDetails,
  });

  final NameUrlCommonRespond? move;
  final dynamic versionGroupDetails;

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: NameUrlCommonRespond.fromJson(json["move"]),
        versionGroupDetails: json["version_group_details"],
      );

  Map<String, dynamic> toJson() => {
        "move": move?.toJson(),
        "version_group_details": versionGroupDetails,
      };
}

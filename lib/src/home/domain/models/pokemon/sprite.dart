class Sprites {
  Sprites({
    this.frontDefault,
    this.other,
  });
  final String? frontDefault;
  final Other? other;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
      frontDefault: json["front_default"],
      other: json["other"] == null ? null : Other.fromJson(json["other"]));

  Map<String, dynamic> toJson() =>
      {"front_default": frontDefault, "other": other?.toJson()};
}

class Other {
  Other({this.officialArtwork});

  final OfficialArtwork? officialArtwork;

  factory Other.fromJson(Map<String, dynamic> json) => Other(
      officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]));

  Map<String, dynamic> toJson() =>
      {"official-artwork": officialArtwork?.toJson()};
}

class OfficialArtwork {
  OfficialArtwork({this.frontDefault});

  final String? frontDefault;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(frontDefault: json["front_default"]);

  Map<String, dynamic> toJson() => {"front_default": frontDefault};
}

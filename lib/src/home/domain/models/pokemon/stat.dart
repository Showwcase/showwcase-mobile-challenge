import '../base_name_url.dart';

class Stat {
  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  final int? baseStat;
  final int? effort;
  final NameUrlCommonRespond? stat;


  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: NameUrlCommonRespond.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat?.toJson(),
      };
}
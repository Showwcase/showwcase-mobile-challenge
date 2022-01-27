class NameUrlCommonRespond {
  NameUrlCommonRespond({
    this.name,
    this.url,
  });

  final String? name;
  final String? url;

  factory NameUrlCommonRespond.fromJson(Map<String, dynamic> json) =>
      NameUrlCommonRespond(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

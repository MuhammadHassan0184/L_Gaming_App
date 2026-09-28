class CountryModel {
  final String name;
  final String code;
  final String region;
  final bool isHot;

  const CountryModel({
    required this.name,
    required this.code,
    required this.region,
    this.isHot = false,
  });

  String get flag {
    return code
        .toUpperCase()
        .runes
        .map(
          (char) => String.fromCharCode(char + 127397),
        )
        .join();
  }
}
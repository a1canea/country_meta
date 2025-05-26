/// Represents metadata for a specific country.
///
/// Includes ISO codes, default name (English), currency info,
/// phone code, and associated locale tags.
class CountryMeta {
  /// ISO 3166-1 alpha-2 code (e.g. 'US', 'RU')
  final String isoAlpha2;

  /// ISO 3166-1 alpha-3 code (e.g. 'USA', 'RUS')
  final String isoAlpha3;

  /// ISO 3166-1 numeric code (e.g. '840', '643')
  final String isoNumeric;

  /// Default country name (usually in English)
  final String name;

  /// Currency ISO code (e.g. 'USD', 'RUB')
  final String currency;

  /// Currency symbol (e.g. '\$', '₽')
  final String currencySymbol;

  /// International phone calling code (e.g. '1', '7')
  final String phoneCode;

  /// List of supported locale codes for this country (e.g. ['en', 'en_US'])
  final List<String> locales;

  const CountryMeta({
    required this.isoAlpha2,
    required this.isoAlpha3,
    required this.isoNumeric,
    required this.name,
    required this.currency,
    required this.currencySymbol,
    required this.phoneCode,
    required this.locales,
  });

  /// Creates a [CountryMeta] instance from a JSON map.
  factory CountryMeta.fromJson(Map<String, dynamic> json) {
    return CountryMeta(
      isoAlpha2: json['isoAlpha2'] as String,
      isoAlpha3: json['isoAlpha3'] as String,
      isoNumeric: json['isoNumeric'] as String,
      name: json['name'] as String,
      currency: json['currency'] as String,
      currencySymbol: json['currencySymbol'] as String,
      phoneCode: json['phoneCode'] as String,
      locales: List<String>.from(json['locales'] as List),
    );
  }

  /// Converts this instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'isoAlpha2': isoAlpha2,
      'isoAlpha3': isoAlpha3,
      'isoNumeric': isoNumeric,
      'name': name,
      'currency': currency,
      'currencySymbol': currencySymbol,
      'phoneCode': phoneCode,
      'locales': locales,
    };
  }

  /// Equality override for comparing two [CountryMeta] objects.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryMeta &&
          runtimeType == other.runtimeType &&
          isoAlpha2 == other.isoAlpha2 &&
          isoAlpha3 == other.isoAlpha3 &&
          isoNumeric == other.isoNumeric &&
          name == other.name &&
          currency == other.currency &&
          currencySymbol == other.currencySymbol &&
          phoneCode == other.phoneCode &&
          locales.length == other.locales.length &&
          locales.every((loc) => other.locales.contains(loc));

  /// Hashing for usage in sets/maps
  @override
  int get hashCode => Object.hash(
        isoAlpha2,
        isoAlpha3,
        isoNumeric,
        name,
        currency,
        currencySymbol,
        phoneCode,
        Object.hashAll(locales),
      );
}

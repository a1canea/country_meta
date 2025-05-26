import '../model/country_meta.dart';
import '../res/data/countries_raw_data.dart';

/// Provides access to the full list of countries and allows efficient lookup
/// by ISO alpha-2, alpha-3, numeric codes or locale identifiers.
class CountryRepository {
  /// Internal list of all countries parsed from raw data.
  static late final List<CountryMeta> _countries =
      countriesRaw.map((e) => CountryMeta.fromJson(e)).toList();

  /// Index of countries by ISO alpha-2 code (e.g. 'US', 'RU').
  static late final Map<String, CountryMeta> _byAlpha2 = {
    for (final c in _countries) c.isoAlpha2.toUpperCase(): c
  };

  /// Index of countries by ISO alpha-3 code (e.g. 'USA', 'RUS').
  static late final Map<String, CountryMeta> _byAlpha3 = {
    for (final c in _countries) c.isoAlpha3.toUpperCase(): c
  };

  /// Index of countries by ISO numeric code (e.g. '840', '643').
  static late final Map<String, CountryMeta> _byNumeric = {
    for (final c in _countries) c.isoNumeric: c
  };

  /// Index of countries by their supported locales (e.g. 'en', 'en_US').
  static late final Map<String, CountryMeta> _byLocale = {
    for (final c in _countries)
      for (final l in c.locales) l.toLowerCase(): c
  };

  /// Returns the full list of available countries.
  static List<CountryMeta> get all => _countries;

  /// Finds a country by its ISO alpha-2 code.
  ///
  /// Example:
  /// ```dart
  /// final country = CountryRepository.byAlpha2('US');
  /// ```
  static CountryMeta? byAlpha2(String code) => _byAlpha2[code.toUpperCase()];

  /// Finds a country by its ISO alpha-3 code.
  static CountryMeta? byAlpha3(String code) => _byAlpha3[code.toUpperCase()];

  /// Finds a country by its ISO numeric code.
  static CountryMeta? byNumeric(String code) => _byNumeric[code];

  /// Finds a country by locale code (e.g. 'en', 'en_US').
  ///
  /// Automatically normalizes to lowercase.
  static CountryMeta? byLocale(String locale) =>
      _byLocale[locale.toLowerCase()];
}

import '../res/names/country_names.dart';

/// Provides localized country name lookups by ISO Alpha-2 code and locale.
class CountryNameLocalizer {
  static final Map<String, Map<String, String>> _localizedMaps = {
    'en': countryNamesEn,
    'ru': countryNamesRu,
    'ar': countryNamesAr,
  };

  /// Returns the localized name for a country by its [isoAlpha2] code and a [localeCode].
  ///
  /// Attempts exact locale match (e.g. 'ru_RU'), then falls back to language (e.g. 'ru'),
  /// then English, and finally returns the ISO code if nothing found.
  static String getLocalizedCountryNameByIso2(
    String isoAlpha2,
    String localeCode,
  ) {
    final iso = isoAlpha2.toUpperCase();
    final normalized = localeCode.toLowerCase();
    final fallback = normalized.split('_').first;

    return _localizedMaps[normalized]?[iso] ??
        _localizedMaps[fallback]?[iso] ??
        countryNamesEn[iso] ??
        iso;
  }
}

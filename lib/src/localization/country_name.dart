import '../model/country_meta.dart';
import 'localized_name.dart';

/// Extension on [CountryMeta] to expose localized name getter.
extension CountryMetaName on CountryMeta {
  /// Returns the localized name of the country for the provided [localeCode].
  String localizedName(String localeCode) {
    return CountryNameLocalizer.getLocalizedCountryNameByIso2(
      isoAlpha2,
      localeCode,
    );
  }
}

import 'package:country_meta/country_meta.dart';

void main() {
  final country = CountryRepository.byAlpha2('US');

  if (country != null) {
    print('Name:     ${country.localizedName('en_US')}');
    print('Currency: ${country.currency} (${country.currencySymbol})');
    print('Phone:    ${country.phoneCode}');

    print('Flag (SVG):   ${country.flagUrl()}');
    print(
        'Flag (JPEG):  ${country.flagUrl(format: FlagImageFormat.jpeg, height: FlagHeight.h160)}');
    print(
        'Flag (WebP):  ${country.flagUrl(format: FlagImageFormat.webp, width: FlagWidth.w320)}');
  } else {
    print('Country not found.');
  }
}

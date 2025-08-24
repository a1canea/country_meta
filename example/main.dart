import 'package:country_meta/country_meta.dart';

void main() {
  // ===== Country lookup example =====
  final us = CountryRepository.byAlpha2('US');

  if (us != null) {
    print('=== United States Example ===');
    print('ISO alpha-2: ${us.isoAlpha2}');
    print('ISO alpha-3: ${us.isoAlpha3}');
    print('ISO numeric: ${us.isoNumeric}');
    print('Phone code: +${us.phoneCode}');
    print('Currency: ${us.currency} (${us.currencySymbol})');

    // Localized names
    print('Name (en): ${us.localizedName('en')}');
    print('Name (ru): ${us.localizedName('ru')}');
    print('Name (ar): ${us.localizedName('ar')}');

    // Emoji flag (strict ISO)
    print('Emoji flag: ${us.flagEmoji()}');

    // Flag URLs
    print('Flag URL (SVG): ${us.flagUrl()}');
    print('Flag URL (WebP 40px): ${us.flagUrl(
      format: FlagImageFormat.webp,
      width: FlagWidth.w40,
    )}');
  }

  // ===== Another country example =====
  final jp = CountryRepository.byAlpha2('JP');
  if (jp != null) {
    print('\n=== Japan Example ===');
    print('Emoji flag: ${jp.flagEmoji()}');
    print('Flag URL (JPEG 80px height): ${jp.flagUrl(
      format: FlagImageFormat.jpeg,
      height: FlagHeight.h80,
    )}');
  }

  // ===== Direct flag access without CountryRepository =====
  print('\n=== Direct Flag Access ===');
  // Emoji flag directly from ISO code
  print('US emoji: ${FlagEmojiBuilder.build('US')}');
  print('DE emoji: ${FlagEmojiBuilder.build('DE')}');

  // Flag URLs directly from ISO code
  print('US SVG:  ${FlagUrlBuilder.svg('US')}');
  print(
      'US WebP (40px width): ${FlagUrlBuilder.webp('US', width: FlagWidth.w40)}');
  print(
      'JP JPEG (80px height): ${FlagUrlBuilder.jpeg('JP', height: FlagHeight.h80)}');
}

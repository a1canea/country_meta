import 'package:test/test.dart';
import 'package:country_meta/country_meta.dart';

void main() {
  group('FlagUrlBuilder', () {
    test('returns SVG URL correctly', () {
      final url =
          FlagUrlBuilder.build(isoAlpha2: 'US', format: FlagImageFormat.svg);
      expect(url, 'https://flagcdn.com/us.svg');
    });

    test('returns WebP URL with width', () {
      final url = FlagUrlBuilder.build(
        isoAlpha2: 'US',
        format: FlagImageFormat.webp,
        width: FlagWidth.w160,
      );
      expect(url, 'https://flagcdn.com/w160/us.webp');
    });

    test('returns JPEG URL with height', () {
      final url = FlagUrlBuilder.build(
        isoAlpha2: 'US',
        format: FlagImageFormat.jpeg,
        height: FlagHeight.h40,
      );
      expect(url, 'https://flagcdn.com/h40/us.jpeg');
    });

    test('falls back to default width when no size specified for raster', () {
      final url = FlagUrlBuilder.build(
        isoAlpha2: 'US',
        format: FlagImageFormat.jpeg,
      );
      expect(url, 'https://flagcdn.com/w40/us.jpeg');
    });

    test('width takes precedence over height when both provided', () {
      final url = FlagUrlBuilder.build(
        isoAlpha2: 'US',
        format: FlagImageFormat.jpeg,
        width: FlagWidth.w40,
        height: FlagHeight.h40,
      );
      expect(url, 'https://flagcdn.com/w40/us.jpeg');
    });

    test('ISO code is lowercased in the URL', () {
      final url =
          FlagUrlBuilder.build(isoAlpha2: 'RU', format: FlagImageFormat.svg);
      expect(url, 'https://flagcdn.com/ru.svg');
    });
  });

  group('CountryMeta.flagUrl()', () {
    final country = CountryRepository.byAlpha2('US')!;

    test('returns SVG flag by default', () {
      expect(country.flagUrl(), 'https://flagcdn.com/us.svg');
    });

    test('returns custom JPEG flag with size', () {
      final url = country.flagUrl(
          format: FlagImageFormat.jpeg, height: FlagHeight.h160);
      expect(url, 'https://flagcdn.com/h160/us.jpeg');
    });
  });
}

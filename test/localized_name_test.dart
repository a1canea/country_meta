import 'package:test/test.dart';
import 'package:country_meta/country_meta.dart';

void main() {
  group('CountryNameLocalizer', () {
    test('returns correct localized name for exact locale match', () {
      final name =
          CountryNameLocalizer.getLocalizedCountryNameByIso2('RU', 'ru_RU');
      expect(name, 'Россия');
    });

    test('returns correct fallback to base language', () {
      final name =
          CountryNameLocalizer.getLocalizedCountryNameByIso2('RU', 'ru_KZ');
      expect(name, 'Россия');
    });

    test('falls back to English if locale not found', () {
      final name =
          CountryNameLocalizer.getLocalizedCountryNameByIso2('US', 'xx');
      expect(name, 'United States');
    });

    test('falls back to isoAlpha2 if all else fails', () {
      final name =
          CountryNameLocalizer.getLocalizedCountryNameByIso2('ZZ', 'zz');
      expect(name, 'ZZ');
    });

    test('locale is case-insensitive', () {
      final name =
          CountryNameLocalizer.getLocalizedCountryNameByIso2('RU', 'RU_ru');
      expect(name, 'Россия');
    });

    test('alpha2 is case-insensitive', () {
      final name =
          CountryNameLocalizer.getLocalizedCountryNameByIso2('us', 'en_US');
      expect(name, 'United States');
    });

    test('unknown alpha2 returns fallback and then key', () {
      final name =
          CountryNameLocalizer.getLocalizedCountryNameByIso2('xx', 'ru');
      expect(name, 'XX');
    });

    test('null-safe usage for known and unknown combinations', () {
      expect(
        () => CountryNameLocalizer.getLocalizedCountryNameByIso2('US', 'en_GB'),
        returnsNormally,
      );
      expect(
        () => CountryNameLocalizer.getLocalizedCountryNameByIso2('XX', 'zz_ZZ'),
        returnsNormally,
      );
    });
  });

  group('CountryMeta extension', () {
    final country = CountryRepository.byAlpha2('US')!;

    test('returns correct name via localizedName(locale)', () {
      expect(country.localizedName('ru_RU'), 'Соединенные Штаты');
    });

    test('returns English if unknown locale provided', () {
      expect(country.localizedName('zz'), 'United States');
    });

    test('returns ISO if country missing in localization', () {
      final unknown = CountryMeta(
        isoAlpha2: 'ZZ',
        isoAlpha3: 'ZZZ',
        isoNumeric: '000',
        name: 'Testlandia',
        currency: 'ZZZ',
        currencySymbol: '?',
        phoneCode: '000',
        locales: ['zz'],
      );
      expect(unknown.localizedName('ar'), 'ZZ');
    });
  });
}

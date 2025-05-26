import 'package:test/test.dart';
import 'package:country_meta/country_meta.dart';

void main() {
  group('CountryRepository', () {
    test('returns all countries', () {
      expect(CountryRepository.all.isNotEmpty, isTrue);
    });

    test('byAlpha2 finds country regardless of case', () {
      expect(CountryRepository.byAlpha2('us')?.isoAlpha2, 'US');
      expect(CountryRepository.byAlpha2('US')?.isoAlpha2, 'US');
      expect(CountryRepository.byAlpha2('uS')?.isoAlpha2, 'US');
    });

    test('byAlpha2 returns null for unknown code', () {
      expect(CountryRepository.byAlpha2('ZZ'), isNull);
    });

    test('byAlpha3 finds country regardless of case', () {
      expect(CountryRepository.byAlpha3('usa')?.isoAlpha3, 'USA');
      expect(CountryRepository.byAlpha3('USA')?.isoAlpha3, 'USA');
    });

    test('byAlpha3 returns null for unknown code', () {
      expect(CountryRepository.byAlpha3('ZZZ'), isNull);
    });

    test('byNumeric finds country by code', () {
      expect(CountryRepository.byNumeric('840')?.isoAlpha2, 'US');
    });

    test('byNumeric returns null for unknown code', () {
      expect(CountryRepository.byNumeric('000'), isNull);
    });

    test('byLocale returns correct country for exact match', () {
      final country = CountryRepository.byLocale('en_US');
      expect(country?.isoAlpha2, 'US');
    });

    test('byLocale is case-insensitive', () {
      final country = CountryRepository.byLocale('EN_us');
      expect(country?.isoAlpha2, 'US');
    });

    test('byLocale returns null for unknown locale', () {
      final country = CountryRepository.byLocale('zz_ZZ');
      expect(country, isNull);
    });

    test('byLocale returns correct country for simple language code', () {
      final country = CountryRepository.byLocale('ru');
      expect(country?.isoAlpha2, 'RU');
    });
  });
}

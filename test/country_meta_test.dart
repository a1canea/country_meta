import 'package:test/test.dart';
import 'package:country_meta/country_meta.dart';

void main() {
  group('CountryMeta model', () {
    final json = {
      'isoAlpha2': 'US',
      'isoAlpha3': 'USA',
      'isoNumeric': '840',
      'name': 'United States',
      'currency': 'USD',
      'currencySymbol': '\$',
      'phoneCode': '1',
      'locales': ['en', 'en_US'],
    };

    test('fromJson parses correctly', () {
      final country = CountryMeta.fromJson(json);
      expect(country.isoAlpha2, 'US');
      expect(country.isoAlpha3, 'USA');
      expect(country.isoNumeric, '840');
      expect(country.name, 'United States');
      expect(country.currency, 'USD');
      expect(country.currencySymbol, '\$');
      expect(country.phoneCode, '1');
      expect(country.locales, ['en', 'en_US']);
    });

    test('toJson produces matching map', () {
      final country = CountryMeta.fromJson(json);
      final serialized = country.toJson();
      expect(serialized, json);
    });

    test('equality works for identical content', () {
      final a = CountryMeta.fromJson(json);
      final b = CountryMeta.fromJson(json);
      expect(a, equals(b));
    });

    test('hashCode is consistent for equal instances', () {
      final a = CountryMeta.fromJson(json);
      final b = CountryMeta.fromJson(json);
      expect(a.hashCode, equals(b.hashCode));
    });

    test('inequality works for different values', () {
      final a = CountryMeta.fromJson(json);
      final b = CountryMeta.fromJson({
        ...json,
        'isoAlpha2': 'CA',
        'name': 'Canada',
      });
      expect(a == b, isFalse);
    });
  });
}

import 'package:test/test.dart';
import 'package:country_meta/country_meta.dart';

void main() {
  test('valid ISO alpha-2 -> emoji', () {
    expect(FlagEmojiBuilder.build('US'), '🇺🇸');
    expect(FlagEmojiBuilder.build('gb'.toUpperCase()), '🇬🇧');
    expect(FlagEmojiBuilder.build('de'), '🇩🇪');
  });

  test('invalid inputs', () {
    expect(FlagEmojiBuilder.build('U'), '');
    expect(FlagEmojiBuilder.build('USA'), '');
    expect(FlagEmojiBuilder.build('1A'), '');
    expect(FlagEmojiBuilder.build('U!'), '');
  });
}

/// Builds a flag emoji string from ISO 3166-1 alpha-2 (e.g., "US" -> "🇺🇸").
/// Strict ISO: only 2 latin letters [A–Z]. No UK→GB normalization.
/// Returns empty string for invalid input.
class FlagEmojiBuilder {
  static const int _regionalIndicatorA = 0x1F1E6; // Regional Indicator 'A'
  static const int _latinA = 0x41; // 'A'
  static const int _latinZ = 0x5A; // 'Z'

  static String build(String isoAlpha2) {
    if (isoAlpha2.length != 2) return '';

    final cc = isoAlpha2.toUpperCase();
    final int a = cc.codeUnitAt(0);
    final int b = cc.codeUnitAt(1);

    // Strict A–Z
    final bool aValid = (a >= _latinA && a <= _latinZ);
    final bool bValid = (b >= _latinA && b <= _latinZ);
    if (!aValid || !bValid) return '';

    final int first = _regionalIndicatorA + (a - _latinA);
    final int second = _regionalIndicatorA + (b - _latinA);
    return String.fromCharCode(first) + String.fromCharCode(second);
  }

  // Aliases
  static String emoji(String isoAlpha2) => build(isoAlpha2);
  static String of(String isoAlpha2) => build(isoAlpha2);
}

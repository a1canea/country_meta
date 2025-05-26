import 'flag_heigth.dart';
import 'flag_image_format.dart';
import 'flag_width.dart';

class FlagUrlBuilder {
  static const _baseUrl = 'https://flagcdn.com';
  static const _defaultWidth = FlagWidth.w40;

  /// Builds a URL to a flag image from Flagcdn
  ///
  /// If [format] is svg, width and height are ignored.
  /// For [webp] or [jpeg], you can optionally specify [width] or [height].
  /// If both [width] and [height] are provided, [width] takes precedence.
  static String build({
    required String isoAlpha2,
    required FlagImageFormat format,
    FlagWidth? width,
    FlagHeight? height,
  }) {
    final iso = isoAlpha2.toLowerCase();

    if (format == FlagImageFormat.svg) {
      return '$_baseUrl/$iso.svg';
    }

    final sizePath = width?.path ?? height?.path ?? _defaultWidth.path;
    return '$_baseUrl/$sizePath/$iso.${format.extension}';
  }

  /// Returns SVG URL (no size applied)
  static String svg(String isoAlpha2) =>
      build(isoAlpha2: isoAlpha2, format: FlagImageFormat.svg);

  /// Returns WebP URL with optional size
  static String webp(
    String isoAlpha2, {
    FlagWidth? width,
    FlagHeight? height,
  }) =>
      build(
        isoAlpha2: isoAlpha2,
        format: FlagImageFormat.webp,
        width: width,
        height: height,
      );

  /// Returns JPEG URL with optional size
  static String jpeg(
    String isoAlpha2, {
    FlagWidth? width,
    FlagHeight? height,
  }) =>
      build(
        isoAlpha2: isoAlpha2,
        format: FlagImageFormat.jpeg,
        width: width,
        height: height,
      );
}

import '../model/country_meta.dart';
import 'flag_emoji_builder.dart';
import 'flag_heigth.dart';
import 'flag_image_format.dart';
import 'flag_url_builder.dart';
import 'flag_width.dart';

extension CountryMetaFlag on CountryMeta {
  /// Returns a URL to the country's flag image.
  ///
  /// Uses [FlagImageFormat.svg] by default. For raster formats, you can optionally
  /// provide [width] or [height]. If both are provided, width takes precedence.
  String flagUrl({
    FlagImageFormat format = FlagImageFormat.svg,
    FlagWidth? width,
    FlagHeight? height,
  }) {
    return FlagUrlBuilder.build(
      isoAlpha2: isoAlpha2,
      format: format,
      width: width,
      height: height,
    );
  }

  /// Emoji flag (offline, zero bundle size). Empty string if invalid ISO alpha-2.
  String flagEmoji() => FlagEmojiBuilder.build(isoAlpha2);
}

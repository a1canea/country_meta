# Changelog

All notable changes to this project will be documented in this file.

## \[1.0.0] - 
- Stable API release.
- Added **emoji flags** (strict ISO only).
- Added **direct flag access** without CountryRepository:
    - `FlagEmojiBuilder.build('US')` → 🇺🇸
    - `FlagUrlBuilder.svg('US')`, `.webp('US', width: ...)`, `.jpeg('US', height: ...)`
- Updated `README.md` with examples and direct-access section.
- Updated `example/main.dart` to demonstrate emoji + direct URL use.

## \[0.0.1] - Initial Release

### Added

* Full `CountryMeta` model with ISO Alpha-2, Alpha-3, Numeric, currency, phone, and locales.
* Localized country names for English, Russian, and Arabic.
* Static utility `CountryNameLocalizer` and extension on `CountryMeta`.
* Country lookup repository with index access by iso/locale.
* Flag URL generation with support for SVG, JPEG, WebP via Flagpedia CDN.
* `FlagImageFormat`, `FlagWidth`, and `FlagHeight` enums.
* Extensions on `CountryMeta` for flag and name access.
* Unit tests for all major components.
* Example usage in `example/main.dart`.
* `README.md`, `LICENSE`, and `pubspec.yaml` metadata.

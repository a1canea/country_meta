# 🌍 country\_meta

[![Pub Version](https://img.shields.io/pub/v/country_meta.svg)](https://pub.dev/packages/country_meta)

A **Dart-only** package providing metadata for countries with ISO codes, localized names, currencies, phone codes, and **flag image utilities** (SVG, WebP, JPEG, Emoji).

---

## 📦 Features

* ✅ ISO Alpha-2, Alpha-3, and Numeric codes
* 📞 Phone codes
* 💱 Currencies and symbols
* 🌐 Localized country names: **English**, **Russian**, **Arabic**
* 🔎 Country lookup by code or locale
* 🏁 Flag support: Emoji, SVG / WebP / JPEG (FlagCDN)
* 🧪 Unit tests for model serialization, equality, and indexing

> 🇺🇳 Flag icons provided by [flagpedia.net](https://flagpedia.net)

## 🚀 Usage

### 🔍 Country Lookup

```dart
final country = CountryRepository.byAlpha2('US');
print(country?.currency); // USD
print(country?.phoneCode); // 1
```

### 🌐 Localized Name

```dart
final name = country?.localizedName('ru_RU');
print(name); // Соединенные Штаты
```

### 🏁 Flag URL

```dart
// Default SVG
final svg = country?.flagUrl();

// JPEG with height
final jpeg = country?.flagUrl(
  format: FlagImageFormat.jpeg,
  height: FlagHeight.h160,
);

// WebP with width
final webp = country?.flagUrl(
  format: FlagImageFormat.webp,
  width: FlagWidth.w320,
);
```

### 😀 Emoji Flag

```dart
final emoji = country?.flagEmoji();
print(emoji); // 🇺🇸
```

### ⚡️ Direct Flag Access
You don’t need to resolve a full CountryMeta to show a flag.
Both emoji and image URLs can be generated directly from ISO alpha-2 codes.

```dart
// Emoji flags
print(FlagEmojiBuilder.build('US')); // 🇺🇸
print(FlagEmojiBuilder.build('DE')); // 🇩🇪

// Flag URLs
print(FlagUrlBuilder.svg('US'));                // https://flagcdn.com/us.svg
print(FlagUrlBuilder.webp('US', width: FlagWidth.w40));
print(FlagUrlBuilder.jpeg('JP', height: FlagHeight.h80));
```

---

## 🧪 Testing

Run all tests:

```bash
dart test
```

Includes tests for:

* ✅ `CountryMeta` model parsing, serialization, equality
* 📦 Country repository lookup
* 🌐 Localized name fallback logic
* 🏁 Flag URL generation and format fallback

---

## 📄 License

[MIT](https://opensource.org/licenses/MIT)

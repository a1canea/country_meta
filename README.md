# 🌍 country\_meta

[![Pub Version](https://img.shields.io/pub/v/country_meta.svg)](https://pub.dev/packages/country_meta)

A **Dart-only** package providing metadata for countries with ISO codes, localized names, currencies, phone codes, and **flag image utilities** (SVG, WebP, JPEG).

---

## 📦 Features

* ✅ ISO Alpha-2, Alpha-3, and Numeric codes
* 📞 Phone codes
* 💱 Currencies and symbols
* 🌐 Localized country names: **English**, **Russian**, **Arabic**
* 🔎 Country lookup by code or locale
* 🏁 Flag URL builder with **SVG / WebP / JPEG** support
* 🧪 Unit tests for model serialization, equality, and indexing

> 🇺🇳 Flag icons provided by [flagpedia.net](https://flagpedia.net)

---

## 📁 Project Structure

```text
lib/
├── country_meta.dart
└── src/
    ├── model/
    │   └── country_meta.dart
    ├── data/
    │   └── country_repository.dart
    ├── res/
    │   ├── data/
    │   │   └── countries_raw_data.dart
    │   └── names/
    │       ├── country_names_en.dart
    │       ├── country_names_ru.dart
    │       ├── country_names_ar.dart
    ├── localization/
    │   ├── localized_name.dart
    │   └── country_name.dart
    └── flags/
        ├── flag_format.dart
        ├── flag_width.dart
        ├── flag_height.dart
        ├── flag_url_builder.dart
        └── country_flag.dart
```

---

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

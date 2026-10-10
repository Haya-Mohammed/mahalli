# Mahalli (محلي)

Mahalli is an offline shop management and point-of-sale app for a single store owner. It is built with Flutter for Android and iOS, with an Arabic and English interface. Sales, stock, customer balances, and business records are stored on the device.

## Features

- **Sales and checkout:** Search or scan products, build a cart, record cash or customer-debt sales, and review sales history.
- **Inventory:** Manage products, services, categories, stock levels, stock movements, damage, and low-stock alerts.
- **Customers and debt:** Track customer balances through a transaction ledger, record payments and adjustments, and view outstanding debt.
- **Returns and expenses:** Record returns and operating expenses alongside sales activity.
- **Reports and receipts:** View sales and profit reports, and generate receipts for PDF sharing or printing.
- **Local tools:** Create and restore file-based backups, protect the app with an optional PIN, and choose language, theme, number digits, and shop currency.

The supported shop currencies are ILS, USD, EUR, and JOD. JOD amounts use three decimal places.

## Getting started

Install Flutter with a Dart SDK compatible with `pubspec.yaml` (Dart 3.11.1 or newer within the 3.x range), plus the Android or iOS tooling for your target device. From the repository root:

```sh
flutter pub get
flutter gen-l10n
dart run build_runner build
flutter run
```

On first launch, enter a shop name, business type, and currency. Mahalli saves the shop locally and opens it directly on later launches. Use an Android or iOS device to check persisted data and device features such as barcode scanning, file backup, and printing.

## Development checks

```sh
dart run tool/check_offline.dart
flutter analyze
flutter test
```

The offline check enforces the project's network-package and platform-permission policy. CI also checks formatting and localization generation; see [the workflow](.github/workflows/quality.yml).

## Project structure

- `lib/core/` contains routing, localization, theme, money helpers, dependency registration, and the local database.
- `lib/features/` groups each business feature's UI, domain rules, and data access.
- `test/` contains feature and workflow tests.
- `docs/QA_RELEASE_CHECKLIST.md` lists the device checks needed before release.

The app uses Cubit for much of its state management, GetIt for dependency registration, and Isar for local business data. Preferences and PIN material use separate device storage. See [ARCHITECTURE.md](ARCHITECTURE.md) for the current data flow and implementation details.

## Data and release notes

Mahalli has no cloud sync or account system. Business data stays on the device unless the owner exports a backup or shares a receipt. Keep backup files somewhere safe, especially before changing devices or reinstalling the app. There is no PIN recovery flow; restoring business data after a forgotten PIN requires a backup.

The Android release manifest does not request internet access. Before publishing, complete the [QA and release checklist](docs/QA_RELEASE_CHECKLIST.md), including physical-device checks, final app identifiers, and signing configuration. The current app identifiers are placeholders (`com.example.mahalli`).

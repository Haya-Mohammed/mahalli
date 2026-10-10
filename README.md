# Mahalli

Offline-first Flutter shop management app for a single owner. Arabic and English localization, POS, inventory, customers and debt, returns, expenses, reports, receipts, backup/restore, local PIN, and settings are implemented without a network layer.

## Run

The Android and iOS project folders are already present. From the project root:

```sh
flutter pub get
dart run build_runner build
flutter gen-l10n
dart run tool/check_offline.dart
flutter analyze
flutter test
flutter run
```

On first launch, enter a shop name, business type, and currency. The current choices are ILS, USD, EUR, and JOD; JOD uses three decimal places. The shop is stored in Isar and onboarding is skipped on later launches. Test persistence on an Android or iOS device; the Windows host does not include Isar's native DLL.

## Current architecture

- `lib/core/database`: one local Isar database and transaction runner.
- `lib/core/config/theme`: light and dark themes based on `DESIGN.md`.
- `lib/core/config/locale/l10n`: Arabic and English ARB files.
- `lib/features/onboarding`: validation, repository, Cubit, and UI.
- `lib/features/security`: optional local PIN, salted PBKDF2 hash in secure storage, lockout, and a five-minute background lock.
- `lib/features/home`: local daily sales, profit, debt, and low-stock dashboard with refresh on Home return and at midnight.
- `lib/features/categories`: product and service category lists, add/edit, duplicate-name validation, and activation controls.
- `lib/features/catalog`: paged local product/service search, barcode scanning and lookup, forms, details, activation controls, and atomic opening-stock movements.
- `lib/features/stock`: stock status filters, movement history, additions, counted-stock adjustments, and damage records. Every change updates the product and adds a movement in one transaction.
- `lib/features/customers`: customer list and forms, debt history, payments, adjustments, and an outstanding-debt overview. Balances are derived from immutable signed ledger entries. Overpayments are rejected; deactivation with debt requires confirmation.
- `lib/features/sales`, `returns`, `expenses`, `reports`, and `receipts`: local POS checkout, atomic stock/debt effects, returns, expenses, profit reports, and saved receipt output.
- `lib/features/backup`: local backup creation and validation before a guarded restore.
- `lib/features/settings`: shop editing, language, light/dark theme, number digits, PIN, backup, receipt, report, and About entry points.

The Inventory tab contains the catalog and opens category and stock management. Customers and expenses are in More; app preferences and utility entry points are consolidated under Settings. Camera scanning, printer output, Isar transactions, and restore recovery must still be checked on Android and iOS devices.

## Quality and release

The Android release manifest has no `INTERNET` permission, disables Android automatic backup and clear-text traffic, and the offline policy check rejects common network/Firebase packages. CI runs format, localization generation, the offline check, analysis, and tests. See [the QA/release checklist](docs/QA_RELEASE_CHECKLIST.md) for the required physical-device and store-release steps.

The current Android and iOS IDs are `com.example.mahalli` until final release identifiers are supplied. Store release requires owner-provided signing credentials and must not use the debug signing configuration. Cairo is named in the theme, but its font asset has not yet been bundled. PIN recovery is not available; after a forgotten PIN, business data must be restored from a backup.

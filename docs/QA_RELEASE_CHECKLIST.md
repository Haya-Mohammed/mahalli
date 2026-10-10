# F19 — QA and release checklist

Automated gates run locally and in CI:

- `dart run tool/check_offline.dart` rejects network packages, a release `INTERNET` permission, Android automatic backup, clear-text traffic, and iOS arbitrary network loads.
- `flutter analyze` and `flutter test` must pass.
- The test suite includes stock-ledger, sale, return, report, PIN, settings, and release-policy coverage.

Before a store release, perform these manual checks on a physical Android and iOS device:

1. Enable airplane mode, restart the app, then complete onboarding, product creation, sale, partial payment, return, expense, report, receipt, backup, and restore.
2. Repeat the key screens in Arabic RTL, English LTR, light and dark themes, at 200% text scale, with TalkBack/VoiceOver enabled.
3. Verify barcode camera permission, PDF share/print, and that a printer error never changes a saved sale.
4. Interrupt a sale, return, and restore while writing; reopen the app and confirm the data is either fully committed or unchanged.
5. Test a signed release build with a real backup file and with a corrupt backup file.

Store release still requires owner-provided Android/iOS signing credentials, final bundle identifiers, store metadata, and real-device validation. Do not commit signing keys or backup files.

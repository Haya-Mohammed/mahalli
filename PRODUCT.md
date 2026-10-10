# Product

<!-- impeccable:product-schema 1 -->

## Platform

android

## Users

Single shop owner / independent retail & grocery store owner in the Arab world / MENA. Fast-paced counter interactions, handling inventory, sales, customer debts, and expenses directly on a mobile device (Android & iOS).

## Product Purpose

Mahalli is a 100% offline-first shop management and POS application for single owners. It enables shopkeepers to record sales, track inventory, manage customer debts and ledger payments, track operating expenses, calculate net profits, print/share receipts, and securely backup data locally without relying on any internet connection or cloud service.

## Positioning

Absolute offline autonomy with zero internet permissions, paired with an Arabic-first ergonomic workflow tailored for local community store practices (immutable customer debt ledgers, local barcode scanning, cash register speed, and currency-aware financial calculations).

## Operating Context

- Countertop or handheld mobile phone/tablet usage during busy store hours.
- Rapid checkout scanning, manual catalog lookups, and on-the-spot debt bookkeeping for known neighborhood customers.
- Fully offline environments with local storage (Isar), local PIN security, and file-based backups.
- Bilingual Arabic (RTL, primary) and English (LTR) interface with multi-currency support (ILS, USD, EUR, JOD with 3 decimal places).

## Capabilities and Constraints

- **Stack:** Flutter (Dart), BLoC state management, Isar local database, flutter_secure_storage.
- **Network Constraint:** Strictly offline-first. No internet permission in Android release manifest; network packages strictly banned.
- **Hardware Integrations:** Camera barcode scanning (mobile_scanner), receipt printing/PDF generation (printing, pdf), local file sharing (share_plus, file_picker).
- **Financial & Data Integrity:** Immutable signed ledger entries for customer debts; atomic inventory and stock transaction updates; PIN lockout protection.

## Brand Commitments

- **Name:** Mahalli (محلي) - "My Shop / Local".
- **Tone:** Practical, trustworthy, utilitarian, clean, Arabic-first typographic hierarchy.

## Product Principles

1. **Zero-Latency Counter Speed:** Cashier operations, item lookups, and debt entries must execute instantly without blocking UI or requiring multiple unnecessary taps.
2. **Ironclad Offline Truth:** Never require network connectivity. All state, transactions, and backups are strictly local and verifiable.
3. **Ledger Integrity:** Customer debts and financial numbers must be transparent, immutable, and mathematically sound with zero ambiguity.
4. **Ergonomic RTL-First UX:** Natural Arabic layout, clear numerals, high contrast readability under diverse retail lighting conditions.

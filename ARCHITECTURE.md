# Architecture

Mahalli is an offline-first Flutter shop app organized by feature. Its primary
state-management pattern is Cubit (`flutter_bloc`), with GetIt for dependency
registration. The codebase uses clean-architecture-style boundaries, but it is
not a uniform MVVM implementation: some screens manage asynchronous state in
the widget and call repository interfaces directly.

## Project layout

```text
lib/
  main.dart                 Flutter startup and dependency initialization
  app.dart                  App-wide providers, theme, locale, and routing
  core/
    config/                 Routes, theme, locale, and number preferences
    database/               Isar service, schemas, collections, transactions
    di/                     Root GetIt registration
    error/, money/          Shared failures and money/quantity helpers
    presentation/, widgets/ Shared UI helpers and widgets
  features/
    <feature>/
      di.dart               Feature registrations, where needed
      domain/               Models, repository contracts, rules, use cases
      data/                 Isar and platform implementations
      presentation/         Pages, widgets, Cubits, and Cubit states
test/                        Feature and workflow tests
```

The feature folders are `backup`, `catalog`, `categories`, `customers`,
`expenses`, `home`, `onboarding`, `receipts`, `reports`, `returns`, `sales`,
`security`, `settings`, `shell`, and `stock`. They do not all contain every
layer. For example, `shell` and `settings` are mainly UI composition, while
`backup` exposes a service from `data/` directly to its page.

## Dependency and data flow

`main.dart` awaits `initDependencies()` before starting `MahalliApp`. The root
container in `core/di/injection_container.dart` opens Isar, registers shared
services and preferences, then calls each feature's `register...` function.
Feature `di.dart` files register repository implementations, use cases where
present, and Cubit factories. Pages obtain Cubits or services from GetIt and
provide Cubits to widget trees with `BlocProvider`.

The usual feature flow is:

```text
Page/widget -> Cubit -> domain repository or use case -> data implementation
                                                    -> Isar/platform service
```

Domain folders hold feature models, repository interfaces, and business rules;
some features also have explicit use cases (for example, stock, customers,
onboarding, and home). Cubits may call a repository interface directly when
there is no use case. Isar repository classes implement those interfaces and
map persisted collections in `core/database/collections/` to domain models.
Shared write transactions use `TransactionRunner`. Sales and returns coordinate
stock and customer debt through other features' repository interfaces inside
those transactions.

The UI is mixed: several screens use Cubit states, while others use
`StatefulWidget`, `FutureBuilder`, and direct calls to registered repository
interfaces. Expenses, returns, reports, receipts, and some sales/customer views
follow the latter pattern. Security's Cubit and pages use `PinService` from
`data/`; the backup page uses `BackupService` directly. Some presentation files
also import enums defined with the Isar collections. These are current
dependencies, so the layers above describe the layout rather than a strict
import rule already enforced throughout the project.

## App composition

`app.dart` provides app-wide locale, theme, number-digit, shop, and PIN Cubits.
The root router enters `AppGate`, which selects onboarding, PIN flow, or the
main `ShellPage` from shop and PIN state. The shell hosts five tabs: Home,
Sales, Inventory, Debts, and More. Feature pages are generally opened with
`MaterialPageRoute` from the shell or another page.

App data is stored locally in Isar. SharedPreferences stores appearance and
number preferences, secure storage holds PIN material, and platform services
support receipts, barcode scanning, and backup import/export. There is no
network data source in the current feature structure.

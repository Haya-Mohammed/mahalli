---
name: Mahalli
description: Offline-first Arabic retail POS, inventory, customer debt ledger, and profit management
colors:
  primary: "#0D7344"
  primary-hover: "#005832"
  primary-muted: "#EBF6EE"
  primary-border-muted: "#9FE1CB"
  accent-value: "#EA580C"
  accent-value-muted: "#FAEEDA"
  neutral-bg: "#FBF9F5"
  neutral-surface: "#FFFFFF"
  neutral-surface-muted: "#F2EFE9"
  neutral-text: "#1C1B18"
  neutral-text-secondary: "#52504A"
  neutral-border: "#DDD9D0"
  success-bg: "#EAF3DE"
  success-border: "#639922"
  success-text: "#27500A"
  warning-bg: "#FAEEDA"
  warning-border: "#BA7517"
  warning-text: "#633806"
  danger-bg: "#FCEBEB"
  danger-border: "#E24B4A"
  danger-text: "#791F1F"
  info-bg: "#E6F1FB"
  info-border: "#378ADD"
  info-text: "#0C447C"
typography:
  display:
    fontFamily: "Cairo, IBM Plex Sans Arabic, sans-serif"
    fontSize: "28px"
    fontWeight: 800
    lineHeight: 1.35
  headline:
    fontFamily: "Cairo, IBM Plex Sans Arabic, sans-serif"
    fontSize: "26px"
    fontWeight: 700
    lineHeight: 1.38
  title:
    fontFamily: "Cairo, IBM Plex Sans Arabic, sans-serif"
    fontSize: "17px"
    fontWeight: 700
    lineHeight: 1.4
  body:
    fontFamily: "Cairo, IBM Plex Sans Arabic, sans-serif"
    fontSize: "16px"
    fontWeight: 500
    lineHeight: 1.6
  label:
    fontFamily: "Cairo, IBM Plex Sans Arabic, sans-serif"
    fontSize: "12px"
    fontWeight: 500
    lineHeight: 1.5
rounded:
  sm: "6px"
  md: "10px"
  lg: "16px"
  pill: "999px"
spacing:
  xs: "4px"
  sm: "8px"
  md: "16px"
  lg: "24px"
  xl: "32px"
  xl2: "48px"
  touch-target-min: "48px"
components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.neutral-surface}"
    rounded: "{rounded.md}"
    padding: "8px 16px"
    height: "56px"
  button-primary-hover:
    backgroundColor: "{colors.primary-hover}"
  card:
    backgroundColor: "{colors.neutral-surface}"
    rounded: "{rounded.lg}"
    padding: "16px"
  input:
    backgroundColor: "{colors.neutral-surface}"
    textColor: "{colors.neutral-text}"
    rounded: "{rounded.md}"
    padding: "18px 16px"
---

# Design System: Mahalli

## Overview

**Creative North Star: "The Neighborhood Counter"**

Mahalli’s interface embodies the welcoming, steadfast presence of a trusted local merchant counter in the Arab world. It balances warm, approachable community touchpoints with the laser focus, speed, and precision needed during rush-hour cashier interactions. The aesthetic couples grounded deep forest greens (`#0D7344`) and clean, warm off-white surfaces (`#FBF9F5`) with warm amber accents, evoking durable physical ledgers, parchment receipt paper, and tactile counter tools.

The layout prioritizes thumb-driven touch targets, glanceable balance indicators, and frictionless numeric input. Every screen is designed RTL-first to make Arabic typography feel native, spacious, and dignified rather than crammed into western patterns.

**Key Characteristics:**
- **RTL-Native Ergonomics:** Arabic typography (Cairo with IBM Plex Sans Arabic fallbacks) sits at generous line heights with large touch targets (minimum 48×48 dp).
- **Glanceable Ledger Distinction:** Debts and critical financial values pop in warm terracotta amber (`#EA580C`), clearly distinct from store operational green.
- **Tonal Reassurance:** Warm neutral borders (`#DDD9D0`) on a gentle off-white canvas reassure the owner that their records are tidy, safe, and immutable.

## Colors

The palette pairs a trustworthy merchant forest green with calm warm off-white neutrals and an unmistakable terracotta financial accent.

### Primary
- **Merchant Forest Green** (`#0D7344` / Dark: `#1D9E75`): Brand anchor, primary actions, positive balance badges, active nav tab indicators.
- **Deep Cypress Hover** (`#005832` / Dark: `#26B386`): Pressed and active states for primary buttons.
- **Fresh Mint Container** (`#EBF6EE` / Dark: `#08382E`): Subtle tint for active items, selections, and nav badges.

### Financial Value (Accent)
- **Terracotta Amber** (`#EA580C` / Dark: `#FAC775`): Financial debt markers, pending balances, total profit summaries, and high-priority monetary indicators. Never used for decorative chrome.

### Neutral
- **Off-White Canvas** (`#FBF9F5` / Dark: `#141413`): App background scaffold, providing a calm, organic, warm off-white background behind cards without green tint.
- **Pure White Surface** (`#FFFFFF` / Dark: `#1C1C1A`): Cards, bottom sheets, input fields, modal sheets.
- **Warm Muted Surface** (`#F2EFE9` / Dark: `#262624`): Inactive sections, table headers, search backgrounds.
- **Espresso Charcoal Ink** (`#1C1B18` / Dark: `#F7F2E9`): Primary headings, body copy, key data numbers.
- **Warm Slate Secondary** (`#52504A` / Dark: `#A8A69E`): Supporting captions, timestamps, item subtitles.
- **Warm Linen Border** (`#DDD9D0` / Dark: `#383834`): Explicit card, divider, and input outlines.

### Semantic Status
- **Success** (Bg: `#EAF3DE`, Border: `#639922`, Text: `#27500A`): Paid in full, completed orders, stock added.
- **Warning** (Bg: `#FAEEDA`, Border: `#BA7517`, Text: `#633806`): Low stock alert, partial payment, pending action.
- **Danger** (Bg: `#FCEBEB`, Border: `#E24B4A`, Text: `#791F1F`): Overdue debt, stock damage/write-off, delete action.
- **Info** (Bg: `#E6F1FB`, Border: `#378ADD`, Text: `#0C447C`): System notices, restore/backup status.

### Named Rules
- **The Financial Accent Rule:** Terracotta amber is reserved strictly for monetary balances and debt metrics. Do not use it as a general UI embellishment.
- **The High-Contrast Scan Rule:** On POS checkout and inventory tables, quantity and prices must maintain at least 4.5:1 contrast against surface backgrounds.

## Typography

**Display & Body Font:** Cairo
**Fallback Font:** IBM Plex Sans Arabic, sans-serif

**Character:** Cairo provides open geometric letterforms, legible Arabic numerals, and distinct word spacing suited for quick counter glances.

### Hierarchy
- **Display** (ExtraBold 800, 28sp, line-height 1.35): Primary screen titles (e.g. Daily Summary, POS Register).
- **Headline** (Bold 700, 26sp, line-height 1.38): Modal headers, customer names in detail screens.
- **Headline Medium** (Bold 700, 22sp, line-height 1.45): Section titles, category group headers.
- **Title Small** (Bold 700, 17sp, line-height 1.4): Button labels, list item titles, price tags.
- **Body Large** (Medium 500, 18sp, line-height 1.55): Primary readable content, search inputs.
- **Body Medium** (Medium 500, 16sp, line-height 1.6): Secondary content, descriptions, field labels.
- **Label Small / Caption** (Medium 500, 12sp, line-height 1.5): Timestamps, barcode numbers, SKU indicators.

### Named Rules
- **The Spacing Over Squeeze Rule:** Arabic text demands higher vertical line heights (1.35–1.6) than Latin typography. Never reduce line height below 1.3.

## Layout

- **Spacing Scale:** Multiples of 4/8dp (`xs: 4dp`, `sm: 8dp`, `md: 16dp`, `lg: 24dp`, `xl: 32dp`, `xl2: 48dp`).
- **Touch Target Floor:** All interactive tap targets (buttons, list actions, keypad digits) strictly adhere to minimum 48×48 dp.
- **Bottom Navigation:** Fixed 72dp height bottom navigation bar with 4-5 clear destinations; active items tinted with `primaryMuted` pill container.
- **RTL-First Flow:** Leading icons, back chevrons, and numerical indicators flip automatically according to the active locale.

## Elevation & Depth

Mahalli adopts a **subtle elevation with card lift** model. Surfaces rest with clean structural outlines (`#BEC9BE` 1px border) and a feather-light ambient shadow, lifting dynamically when interacted with or elevated into modal overlays.

### Shadow Vocabulary
- **Ambient Card Rest** (`box-shadow: 0 1px 2px rgba(44, 44, 42, 0.06)`): Resting cards, list tiles.
- **Elevated / Modal** (`box-shadow: 0 2px 6px rgba(44, 44, 42, 0.08)`): Raised floating buttons, active drag items.
- **Overlay / Bottom Sheet** (`box-shadow: 0 8px 24px rgba(44, 44, 42, 0.12)`): Modal bottom sheets, full-screen dialogs.
- **Focus Ring** (`box-shadow: 0 0 0 3px rgba(29, 158, 117, 0.35)`): Keyboard & scanner focus indicators.

## Shapes

- **Small Radius (6dp):** Checkboxes, filter chips, tag badges.
- **Medium Radius (10dp):** Primary buttons, text input fields, segmented buttons.
- **Large Radius (16dp - 20dp):** Dashboard summary cards, bottom sheet containers.
- **Pill (999dp):** Status indicators, floating action pills, barcode scanner triggers.

## Components

- **Primary Button:** 56dp height on mobile, 10dp radius, filled `#0D7344` with white Cairo Title Small type.
- **Input Fields:** 18dp vertical padding, 10dp radius, clean 1px border, filled with pure white surface.
- **Cards:** 16dp internal padding, 16dp radius, 1px subtle border, soft ambient shadow at rest.
- **Navigation Bar:** 72dp height, surface white background, active icon and label highlighted in primary forest green.

## Do's and Don'ts

### Do's
- **Do** test every form and calculation view in RTL Arabic locale first.
- **Do** format currency amounts clearly with their specific symbol/code (ILS, USD, EUR, JOD with 3 decimal places).
- **Do** provide immediate physical/haptic or visual feedback on barcode scan and quantity adjustment.

### Don'ts
- **Don't** use arbitrary drop shadows or heavy blur cards.
- **Don't** use red for customer debt unless it is an overdue/danger state; use terracotta amber (`#EA580C`) for standard pending balances.
- **Don't** create touch targets smaller than 48×48 dp, especially in fast-tap POS checkout and number pads.

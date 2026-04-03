import 'package:flutter/material.dart';

/// PaxAide typography.
/// Fonts are bundled locally under assets/fonts/sora and assets/fonts/space_mono.
/// Declare them in pubspec.yaml — see bottom of this file for the snippet.
abstract final class AppTypography {
  // ─── Font family constants ─────────────────────────────────────
  static const sora      = 'Sora';
  static const spaceMono = 'SpaceMono';

  // ─────────────────────────────────────────────────────────────────
  // Sora — display, headings, body
  // ─────────────────────────────────────────────────────────────────

  /// Hero / page display — 3.2rem / 700
  static const display = TextStyle(
    fontFamily: sora,
    fontSize: 48,
    fontWeight: FontWeight.w700,
    height: 1.1,
    letterSpacing: -0.5,
  );

  /// Section title — 1.6rem / 700
  static const h1 = TextStyle(
    fontFamily: sora,
    fontSize: 26,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.2,
  );

  /// Card / project name — 1.1rem / 600
  static const h2 = TextStyle(
    fontFamily: sora,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  /// Sub-heading — 600
  static const h3 = TextStyle(
    fontFamily: sora,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  /// Body — 15px / 400 / 1.7 leading
  static const body = TextStyle(
    fontFamily: sora,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.7,
  );

  /// Body small — 13px / 400
  static const bodySmall = TextStyle(
    fontFamily: sora,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  /// Caption / tag — 11px / 400
  static const caption = TextStyle(
    fontFamily: sora,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  /// Light descriptive text — 300
  static const bodyLight = TextStyle(
    fontFamily: sora,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.7,
  );

  // ─────────────────────────────────────────────────────────────────
  // Space Mono — labels, badges, nav, code, section eyebrows
  // ─────────────────────────────────────────────────────────────────

  /// Nav links & CTAs — 12px / 400 / 1px tracking
  static const monoNav = TextStyle(
    fontFamily: spaceMono,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.0,
  );

  /// Section eyebrow — 10px / 400 / 3px tracking
  static const monoEyebrow = TextStyle(
    fontFamily: spaceMono,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 3.0,
  );

  /// Badge / chip — 10px / 400
  static const monoBadge = TextStyle(
    fontFamily: spaceMono,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );

  /// Stat / metric number — 18px / 700
  static const monoStat = TextStyle(
    fontFamily: spaceMono,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  /// Hero logo / brand — 14px / 400 / 2px tracking
  static const monoBrand = TextStyle(
    fontFamily: spaceMono,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 2.0,
  );

  /// Code / hex snippets — 12px / 400
  static const monoCode = TextStyle(
    fontFamily: spaceMono,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 2.0,
  );

  /// Timestamps & small metadata — 11px
  static const monoMeta = TextStyle(
    fontFamily: spaceMono,
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );

  // ─────────────────────────────────────────────────────────────────
  // TextTheme — wired into ThemeData
  // ─────────────────────────────────────────────────────────────────

  static TextTheme textTheme(Color primary, Color secondary, Color disabled) =>
      TextTheme(
        displayLarge:  display.copyWith(color: primary),
        displayMedium: h1.copyWith(color: primary),
        displaySmall:  h2.copyWith(color: primary),
        headlineMedium: h3.copyWith(color: primary),
        titleLarge:    h2.copyWith(color: primary),
        titleMedium:   h3.copyWith(color: primary),
        titleSmall:    bodySmall.copyWith(fontWeight: FontWeight.w600, color: primary),
        bodyLarge:     body.copyWith(color: primary),
        bodyMedium:    body.copyWith(color: secondary),
        bodySmall:     bodySmall.copyWith(color: secondary),
        labelLarge:    monoNav.copyWith(color: primary),
        labelMedium:   monoBadge.copyWith(color: secondary),
        labelSmall:    monoEyebrow.copyWith(color: disabled),
      );
}

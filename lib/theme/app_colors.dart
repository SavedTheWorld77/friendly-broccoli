import 'package:flutter/material.dart';

/// PaxAide color tokens.
/// All raw hex values live here — nothing else imports hex strings.
abstract final class AppColors {
  // ─── Brand: Cyan ───────────────────────────────────────────────
  static const cyan50  = Color(0xFFE8F9FE);
  static const cyan100 = Color(0xFF9FE5F9);
  static const cyan300 = Color(0xFF54C5F8); // primary interactive
  static const cyan400 = Color(0xFF13B9FD); // hover / pressed
  static const cyan600 = Color(0xFF0090D4);
  static const cyan800 = Color(0xFF005F8A);
  static const cyan900 = Color(0xFF003555);

  // ─── Brand: Green (success / available) ────────────────────────
  static const green50  = Color(0xFFD4FFF4);
  static const green200 = Color(0xFF7FFFD8);
  static const green400 = Color(0xFF00C896); // semantic success
  static const green600 = Color(0xFF009970);
  static const green800 = Color(0xFF005C42);

  // ─── Brand: Amber (warning / Firebase / hold) ──────────────────
  static const amber50  = Color(0xFFFFF3CD);
  static const amber200 = Color(0xFFFFCA28);
  static const amber400 = Color(0xFFFFA000); // semantic warning
  static const amber600 = Color(0xFFCC7A00);
  static const amber800 = Color(0xFF7A4800);

  // ─── Semantic: Danger ──────────────────────────────────────────
  static const red400 = Color(0xFFE24B4A);
  static const red600 = Color(0xFFA32D2D);
  static const red100 = Color(0xFFF7C1C1);

  // ─── Dark mode surfaces ────────────────────────────────────────
  static const darkBg       = Color(0xFF0C0F14); // page background
  static const darkSurface  = Color(0xFF13181F); // card / sheet
  static const darkSurface2 = Color(0xFF1A2029); // nested / input bg
  static const darkElevated = Color(0xFF212837); // elevated card
  static const darkBorder   = Color(0xFF2A3140); // default border
  static const darkBorderHi = Color(0xFF3C4658); // active border

  // ─── Dark mode text ────────────────────────────────────────────
  static const darkTextPrimary   = Color(0xFFE8EDF5);
  static const darkTextSecondary = Color(0xFFA8B4C8);
  static const darkTextMuted     = Color(0xFF6B7A96);
  static const darkTextDisabled  = Color(0xFF3C4658);

  // ─── Light mode surfaces ───────────────────────────────────────
  static const lightBg       = Color(0xFFF5F7FA);
  static const lightSurface  = Color(0xFFFFFFFF);
  static const lightSurface2 = Color(0xFFF0F2F5);
  static const lightElevated = Color(0xFFE8ECF2);
  static const lightBorder   = Color(0xFFDDE1EA);
  static const lightBorderHi = Color(0xFFBCC3D0);

  // ─── Light mode text ───────────────────────────────────────────
  static const lightTextPrimary   = Color(0xFF0D1117);
  static const lightTextSecondary = Color(0xFF3D4A5C);
  static const lightTextMuted     = Color(0xFF6B7A96);
  static const lightTextDisabled  = Color(0xFFBCC3D0);

  // ─── Shared / always-same ──────────────────────────────────────
  static const transparent = Colors.transparent;
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
}

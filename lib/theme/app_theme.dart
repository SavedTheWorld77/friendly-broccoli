import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_typography.dart';

abstract final class AppTheme {
  // ─────────────────────────────────────────────────────────────────
  // DARK
  // ─────────────────────────────────────────────────────────────────
  static ThemeData get dark {
    const primary   = AppColors.cyan300;
    const onPrimary = AppColors.cyan900;

    final textTheme = AppTypography.textTheme(
      AppColors.darkTextPrimary,
      AppColors.darkTextSecondary,
      AppColors.darkTextMuted,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBg,

      // ── Color scheme ──────────────────────────────────────────────
      colorScheme: const ColorScheme.dark(
        primary:          primary,
        onPrimary:        onPrimary,
        primaryContainer: AppColors.cyan800,
        onPrimaryContainer: AppColors.cyan50,
        secondary:        AppColors.green400,
        onSecondary:      AppColors.green800,
        tertiary:         AppColors.amber400,
        onTertiary:       AppColors.amber800,
        error:            AppColors.red400,
        onError:          AppColors.red100,
        surface:          AppColors.darkSurface,
        onSurface:        AppColors.darkTextPrimary,
        onSurfaceVariant: AppColors.darkTextSecondary,
        outline:          AppColors.darkBorder,
        outlineVariant:   AppColors.darkBorderHi,
        surfaceContainerHighest: AppColors.darkElevated,
        surfaceContainerHigh:    AppColors.darkSurface2,
        surfaceContainer:        AppColors.darkSurface,
        surfaceContainerLow:     AppColors.darkBg,
      ),

      // ── Typography ────────────────────────────────────────────────
      textTheme: textTheme,
      fontFamily: AppTypography.sora,

      // ── AppBar ────────────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkBg.withOpacity(0.92),
        foregroundColor: AppColors.darkTextPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.monoBrand.copyWith(
          color: primary,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        ),
      ),

      // ── Card ──────────────────────────────────────────────────────
      cardTheme: CardThemeData(
        color: AppColors.darkSurface,
        surfaceTintColor: AppColors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.darkBorder, width: 0.5),
        ),
        margin: EdgeInsets.zero,
      ),

      // ── Elevated button ───────────────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          elevation: 0,
          textStyle: AppTypography.monoNav.copyWith(fontWeight: FontWeight.w700),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),

      // ── Outlined button ───────────────────────────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.darkTextPrimary,
          textStyle: AppTypography.monoNav,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: const BorderSide(color: AppColors.darkBorder),
        ),
      ),

      // ── Text button ───────────────────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          textStyle: AppTypography.monoNav,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),

      // ── Input / TextField ─────────────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurface2,
        hintStyle: AppTypography.body.copyWith(color: AppColors.darkTextMuted),
        labelStyle: AppTypography.bodySmall.copyWith(color: AppColors.darkTextSecondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.darkBorder, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.darkBorder, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primary, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),

      // ── Chip ──────────────────────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.darkSurface2,
        labelStyle: AppTypography.monoBadge.copyWith(color: AppColors.darkTextSecondary),
        side: const BorderSide(color: AppColors.darkBorder, width: 0.5),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),

      // ── Divider ───────────────────────────────────────────────────
      dividerTheme: const DividerThemeData(
        color: AppColors.darkBorder,
        thickness: 0.5,
        space: 0,
      ),

      // ── BottomNavigationBar ───────────────────────────────────────
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkSurface,
        selectedItemColor: primary,
        unselectedItemColor: AppColors.darkTextMuted,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),

      // ── NavigationBar (M3) ────────────────────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.darkSurface,
        indicatorColor: AppColors.cyan900,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: primary);
          }
          return const IconThemeData(color: AppColors.darkTextMuted);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTypography.caption.copyWith(color: primary);
          }
          return AppTypography.caption.copyWith(color: AppColors.darkTextMuted);
        }),
      ),

      // ── Dialog ────────────────────────────────────────────────────
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.darkSurface,
        surfaceTintColor: AppColors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.darkBorder, width: 0.5),
        ),
        titleTextStyle: AppTypography.h2.copyWith(color: AppColors.darkTextPrimary),
        contentTextStyle: AppTypography.body.copyWith(color: AppColors.darkTextSecondary),
      ),

      // ── SnackBar ──────────────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.darkElevated,
        contentTextStyle: AppTypography.bodySmall.copyWith(color: AppColors.darkTextPrimary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        behavior: SnackBarBehavior.floating,
      ),

      // ── Switch ────────────────────────────────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected) ? onPrimary : AppColors.darkTextMuted),
        trackColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected) ? primary : AppColors.darkSurface2),
      ),

      // ── Tabs ──────────────────────────────────────────────────────
      tabBarTheme: TabBarThemeData(
        labelColor: primary,
        unselectedLabelColor: AppColors.darkTextMuted,
        indicatorColor: primary,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: AppTypography.monoNav,
        unselectedLabelStyle: AppTypography.monoNav,
        dividerColor: AppColors.darkBorder,
      ),

      // ── List tile ─────────────────────────────────────────────────
      listTileTheme: ListTileThemeData(
        tileColor: AppColors.transparent,
        textColor: AppColors.darkTextPrimary,
        iconColor: AppColors.darkTextMuted,
        subtitleTextStyle: AppTypography.bodySmall.copyWith(
          color: AppColors.darkTextSecondary,
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────
  // LIGHT
  // ─────────────────────────────────────────────────────────────────
  static ThemeData get light {
    const primary   = AppColors.cyan600;
    const onPrimary = AppColors.white;

    final textTheme = AppTypography.textTheme(
      AppColors.lightTextPrimary,
      AppColors.lightTextSecondary,
      AppColors.lightTextMuted,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBg,

      // ── Color scheme ──────────────────────────────────────────────
      colorScheme: const ColorScheme.light(
        primary:          primary,
        onPrimary:        onPrimary,
        primaryContainer: AppColors.cyan50,
        onPrimaryContainer: AppColors.cyan800,
        secondary:        AppColors.green600,
        onSecondary:      AppColors.white,
        tertiary:         AppColors.amber600,
        onTertiary:       AppColors.white,
        error:            AppColors.red600,
        onError:          AppColors.white,
        surface:          AppColors.lightSurface,
        onSurface:        AppColors.lightTextPrimary,
        onSurfaceVariant: AppColors.lightTextSecondary,
        outline:          AppColors.lightBorder,
        outlineVariant:   AppColors.lightBorderHi,
        surfaceContainerHighest: AppColors.lightElevated,
        surfaceContainerHigh:    AppColors.lightSurface2,
        surfaceContainer:        AppColors.lightSurface,
        surfaceContainerLow:     AppColors.lightBg,
      ),

      // ── Typography ────────────────────────────────────────────────
      textTheme: textTheme,
      fontFamily: AppTypography.sora,

      // ── AppBar ────────────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightSurface.withOpacity(0.95),
        foregroundColor: AppColors.lightTextPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.monoBrand.copyWith(
          color: primary,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),

      // ── Card ──────────────────────────────────────────────────────
      cardTheme: CardThemeData(
        color: AppColors.lightSurface,
        surfaceTintColor: AppColors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.lightBorder, width: 0.5),
        ),
        margin: EdgeInsets.zero,
      ),

      // ── Elevated button ───────────────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          elevation: 0,
          textStyle: AppTypography.monoNav.copyWith(fontWeight: FontWeight.w700),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),

      // ── Outlined button ───────────────────────────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.lightTextPrimary,
          textStyle: AppTypography.monoNav,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: const BorderSide(color: AppColors.lightBorder),
        ),
      ),

      // ── Text button ───────────────────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          textStyle: AppTypography.monoNav,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),

      // ── Input / TextField ─────────────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightSurface2,
        hintStyle: AppTypography.body.copyWith(color: AppColors.lightTextMuted),
        labelStyle: AppTypography.bodySmall.copyWith(color: AppColors.lightTextSecondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.lightBorder, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.lightBorder, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primary, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),

      // ── Chip ──────────────────────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.lightSurface2,
        labelStyle: AppTypography.monoBadge.copyWith(color: AppColors.lightTextSecondary),
        side: const BorderSide(color: AppColors.lightBorder, width: 0.5),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),

      // ── Divider ───────────────────────────────────────────────────
      dividerTheme: const DividerThemeData(
        color: AppColors.lightBorder,
        thickness: 0.5,
        space: 0,
      ),

      // ── BottomNavigationBar ───────────────────────────────────────
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightSurface,
        selectedItemColor: primary,
        unselectedItemColor: AppColors.lightTextMuted,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),

      // ── NavigationBar (M3) ────────────────────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.lightSurface,
        indicatorColor: AppColors.cyan50,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: primary);
          }
          return const IconThemeData(color: AppColors.lightTextMuted);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTypography.caption.copyWith(color: primary);
          }
          return AppTypography.caption.copyWith(color: AppColors.lightTextMuted);
        }),
      ),

      // ── Dialog ────────────────────────────────────────────────────
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.lightSurface,
        surfaceTintColor: AppColors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.lightBorder, width: 0.5),
        ),
        titleTextStyle: AppTypography.h2.copyWith(color: AppColors.lightTextPrimary),
        contentTextStyle: AppTypography.body.copyWith(color: AppColors.lightTextSecondary),
      ),

      // ── SnackBar ──────────────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.lightElevated,
        contentTextStyle: AppTypography.bodySmall.copyWith(color: AppColors.lightTextPrimary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        behavior: SnackBarBehavior.floating,
      ),

      // ── Switch ────────────────────────────────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected) ? onPrimary : AppColors.lightTextMuted),
        trackColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected) ? primary : AppColors.lightSurface2),
      ),

      // ── Tabs ──────────────────────────────────────────────────────
      tabBarTheme: TabBarThemeData(
        labelColor: primary,
        unselectedLabelColor: AppColors.lightTextMuted,
        indicatorColor: primary,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: AppTypography.monoNav,
        unselectedLabelStyle: AppTypography.monoNav,
        dividerColor: AppColors.lightBorder,
      ),

      // ── List tile ─────────────────────────────────────────────────
      listTileTheme: ListTileThemeData(
        tileColor: AppColors.transparent,
        textColor: AppColors.lightTextPrimary,
        iconColor: AppColors.lightTextMuted,
        subtitleTextStyle: AppTypography.bodySmall.copyWith(
          color: AppColors.lightTextSecondary,
        ),
      ),
    );
  }
}

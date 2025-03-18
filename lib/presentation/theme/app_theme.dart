import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Theme configuration for the application
/// 
/// Sets up the Material 3 theme with appropriate colors and other theme settings
/// with support for light and dark modes, as well as accessibility features
class AppTheme {
  /// Private constructor to prevent instantiation
  AppTheme._();
  
  /// Primary color seed for the app in light mode
  static const Color _primaryColorLight = Color(0xFF6750A4);
  
  /// Primary color seed for the app in dark mode
  static const Color _primaryColorDark = Color(0xFF9A82DB);
  
  /// Light theme for the app
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColorLight,
      brightness: Brightness.light,
    ),
    // AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black87, 
      ),
      titleTextStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    ),
    // Card theme
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 0,
      ),
    ),
    // Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    // Chip theme
    chipTheme: ChipThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      side: BorderSide.none,
    ),
    // Icon theme
    iconTheme: IconThemeData(
      size: 24,
      color: Colors.black87, 
    ),
    // Snackbar theme
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    // Dialog theme
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
    ),
  );

  /// Dark theme for the app
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColorDark,
      brightness: Brightness.dark,
    ),
    // AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      iconTheme: IconThemeData(
        color: Colors.white.withAlpha(222), 
      ),
      titleTextStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    ),
    // Card theme
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 0,
      ),
    ),
    // Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    // Chip theme
    chipTheme: ChipThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      side: BorderSide.none,
    ),
    // Icon theme
    iconTheme: IconThemeData(
      size: 24,
      color: Colors.white.withAlpha(222), 
    ),
    // Snackbar theme
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    // Dialog theme
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/style/color_schemes.dart'; //einbinden des color schemes

ThemeData getDarkTheme() {
  var theme = ThemeData.from(
    useMaterial3: true,
    colorScheme: darkColorScheme, //aus color_schemes.dart
    textTheme: TextTheme(
      //Display
      titleLarge: GoogleFonts.anton(
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.w200),
      bodyMedium: GoogleFonts.aboreto(
          fontSize: 38,
          color: Colors.white),
    ),
  );
  theme = theme.copyWith(
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
        foregroundColor: theme.colorScheme.onPrimary,
        backgroundColor: theme.colorScheme.primary,
      ),
    ),
  );
  return theme;
}
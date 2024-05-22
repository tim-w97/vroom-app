import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_schemes.dart';

ThemeData getLightTheme() {
  var theme = ThemeData.from(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.zenMaruGothic(
          fontSize: 45, color: Colors.black, fontWeight: FontWeight.w300),
      bodyMedium: GoogleFonts.zenMaruGothic(
          fontSize: 25, color: const Color(0xFF000000)),
      bodySmall: GoogleFonts.zenMaruGothic(
          fontSize: 25, color: const Color(0xFF000000)),
    ),
  );
  theme = theme.copyWith(
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black38,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
        foregroundColor: theme.colorScheme.onPrimary,
        backgroundColor: theme.colorScheme.primary,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: theme.colorScheme.onPrimary,
        backgroundColor: theme.colorScheme.primary,
        shape: const CircleBorder()
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: theme.colorScheme.surface,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.outline, width: 2),
        ),
        /*enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: theme.colorScheme.outline, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),*/
        labelStyle: TextStyle(color: theme.colorScheme.onPrimary)),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6))),
    ),
    checkboxTheme: const CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
  );
  return theme;
}

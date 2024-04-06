import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';

/// Custom Class for Light & Dark Text Themes
class TTextTheme {
  TTextTheme._(); // To avoid creating instances

  static TextTheme _buildTextTheme(Color color) {
    return TextTheme(
      headlineLarge: GoogleFonts.exo2(fontSize: 32.0, fontWeight: FontWeight.bold, color: color),
      headlineMedium: GoogleFonts.exo2(fontSize: 24.0, fontWeight: FontWeight.w600, color: color),
      headlineSmall: GoogleFonts.exo2(fontSize: 18.0, fontWeight: FontWeight.w600, color: color),

      titleLarge: GoogleFonts.exo2(fontSize: 16.0, fontWeight: FontWeight.w600, color: color),
      titleMedium: GoogleFonts.exo2(fontSize: 16.0, fontWeight: FontWeight.w500, color: color),
      titleSmall: GoogleFonts.exo2(fontSize: 16.0, fontWeight: FontWeight.w400, color: color),

      bodyLarge: GoogleFonts.exo2(fontSize: 14.0, fontWeight: FontWeight.w500, color: color),
      bodyMedium: GoogleFonts.exo2(fontSize: 14.0, fontWeight: FontWeight.normal, color: color),
      bodySmall: GoogleFonts.exo2(fontSize: 14.0, fontWeight: FontWeight.w500, color: color.withOpacity(0.5)),

      labelLarge: GoogleFonts.exo2(fontSize: 12.0, fontWeight: FontWeight.normal, color: color),
      labelMedium: GoogleFonts.exo2(fontSize: 12.0, fontWeight: FontWeight.normal, color: color.withOpacity(0.5)),
    );
  }

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = _buildTextTheme(TColors.dark);

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = _buildTextTheme(TColors.light);
}

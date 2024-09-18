import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResponsiveTextTheme {
  static TextTheme getTextTheme(BuildContext context) {
    // Determine screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Determine if the device is a tablet
    bool isTablet = screenWidth > 600;

    // Define base text styles with Google Fonts
    double headline1Size = isTablet ? 32.0 : 24.0;
    double headline2Size = isTablet ? 24.0 : 16.0;
    double bodyText1Size = isTablet ? 20.0 : 12.8;
    double bodyText2Size = isTablet ? 18.0 : 10.28;

    return TextTheme(
      headlineLarge: GoogleFonts.nunito(
        fontSize: headline1Size,
        fontWeight: FontWeight.bold,

      ),
      headlineMedium: GoogleFonts.nunito(
        fontSize: headline2Size,
        fontWeight: FontWeight.bold,

      ),
      headlineSmall: GoogleFonts.nunito(
        fontSize: bodyText1Size,

      ),
      titleLarge: GoogleFonts.nunito(
        fontSize: bodyText2Size,

      ),
      
    );
  }
}

import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      textTheme: TextTheme(
        headline1: TextStyle(
          letterSpacing: 2.0,
          fontWeight: FontWeight.w700,
          color: isDarkTheme ? Colors.white70 : Colors.black87,
        ),
        headline2: TextStyle(
          letterSpacing: 2.0,
          fontWeight: FontWeight.w700,
          color: isDarkTheme ? Colors.white70 : Colors.black87,
        ),
        headline3: TextStyle(
          letterSpacing: 2.0,
          fontWeight: FontWeight.w700,
          color: isDarkTheme ? Colors.white70 : Colors.black87,
        ),
        headline4: TextStyle(
          letterSpacing: 2.0,
          fontWeight: FontWeight.w700,
          color: isDarkTheme ? Colors.white70 : Colors.black87,
        ),
        headline5: TextStyle(
          letterSpacing: 2.0,
          fontWeight: FontWeight.w700,
          color: isDarkTheme ? Colors.white70 : Colors.black87,
        ),
        headline6: TextStyle(
          letterSpacing: 2.0,
          fontWeight: FontWeight.w700,
          color: isDarkTheme ? Colors.white70 : Colors.black87,
        ),
        subtitle1: TextStyle(
          color: isDarkTheme ? Colors.white54 : Colors.black45,
        ),
        subtitle2: TextStyle(
          color: isDarkTheme ? Colors.white54 : Colors.black45,
        ),
        button: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      fontFamily: "Blinker",
      primarySwatch: const MaterialColor(
        0xFFFFD166,
        <int, Color>{
          50: Color(0xFFFFF9ED),
          100: Color(0xFFFFF1D1),
          200: Color(0xFFFFE8B3),
          300: Color(0xFFFFDF94),
          400: Color(0xFFFFD87D),
          500: Color(0xFFFFD166),
          600: Color(0xFFFFCC5E),
          700: Color(0xFFFFC653),
          800: Color(0xFFFFC049),
          900: Color(0xFFFFB538),
        },
      ),
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      backgroundColor: isDarkTheme ? Colors.black : Colors.white,
      disabledColor: Colors.grey,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? const ColorScheme.dark() : const ColorScheme.light()),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}

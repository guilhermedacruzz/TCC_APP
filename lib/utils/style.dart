import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      textTheme: TextTheme(
        headline1: TextStyle(
          letterSpacing: 2.0,
          fontWeight: FontWeight.w700,
          color: isDarkTheme ? Colors.white : Colors.black87,
        ),
        headline2: TextStyle(
          letterSpacing: 2.0,
          fontWeight: FontWeight.w700,
          color: isDarkTheme ? Colors.white : Colors.black87,
        ),
        headline3: TextStyle(
          letterSpacing: 2.0,
          fontWeight: FontWeight.w700,
          color: isDarkTheme ? Colors.white : Colors.black87,
        ),
        headline4: TextStyle(
          letterSpacing: 2.0,
          fontWeight: FontWeight.w700,
          color: isDarkTheme ? Colors.white : Colors.black87,
        ),
        headline5: TextStyle(
          fontWeight: FontWeight.w700,
          color: isDarkTheme ? Colors.white : Colors.black87,
        ),
        headline6: TextStyle(
          fontWeight: FontWeight.w700,
          color: isDarkTheme ? Colors.white : Colors.black87,
        ),
        subtitle1: TextStyle(
          color: isDarkTheme ? Colors.white70 : Colors.black45,
        ),
        subtitle2: TextStyle(
          color: isDarkTheme ? Colors.white70 : Colors.black45,
        ),
        button: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: isDarkTheme ? Colors.black : Colors.white,
        ),
      ),
      fontFamily: "Blinker",
      primarySwatch: const MaterialColor(
        0xFF8BDF9E,
        <int, Color>{
          50: Color(0xFFF1FBF3),
          100: Color(0xFFDCF5E2),
          200: Color(0xFFC5EFCF),
          300: Color(0xFFAEE9BB),
          400: Color(0xFF9CE4AD),
          500: Color(0xFF8BDF9E),
          600: Color(0xFF83DB96),
          700: Color(0xFF78D78C),
          800: Color(0xFF6ED282),
          900: Color(0xFF5BCA70),
        },
      ),
      backgroundColor: isDarkTheme ? Colors.black : Colors.white,
      highlightColor: const Color(0xffBC9BDD),
      indicatorColor: const Color(0xff4F4C5F),
      disabledColor: Colors.grey,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light(),
          ),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        collapsedIconColor: Color(0xFFFFD87D),
        iconColor: Color(0xFFFFD87D),
        collapsedTextColor: Color(0xFFFFD87D),
        textColor: Color(0xFFFFD87D),
      ),
    );
  }
}

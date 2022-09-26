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
        0xFF14213D,
        <int, Color>{
          50: Color(0xFFE3E4E8),
          100: Color(0xFFB9BCC5),
          200: Color(0xFF8A909E),
          300: Color(0xFF5B6477),
          400: Color(0xFF37425A),
          500: Color(0xFF14213D),
          600: Color(0xFF121D37),
          700: Color(0xFF0E182F),
          800: Color(0xFF0B1427),
          900: Color(0xFF060B1A),
        },
      ),
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      backgroundColor: isDarkTheme ? Colors.black : Colors.white,
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      highlightColor: isDarkTheme ? Color(0xffB00020) : Color(0xffFCE192),
      hoverColor:
          isDarkTheme ? Color(0xff3B3B3B) : Color.fromARGB(119, 225, 230, 238),
      focusColor: isDarkTheme ? Colors.cyan : Colors.pink,
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}

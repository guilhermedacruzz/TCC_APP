import 'package:shared_preferences/shared_preferences.dart';

class PreferenceDarkTheme {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS , value);
  }

  Future<bool> getTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(THEME_STATUS ) ?? false;
  }
}
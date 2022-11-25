import 'package:flutter/foundation.dart';
import 'package:tcc/utils/preference/preference_dark_theme.dart';

class ProviderDarkTheme with ChangeNotifier {
  PreferenceDarkTheme preferenceDarkTheme = PreferenceDarkTheme();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    preferenceDarkTheme.setDarkTheme(value);
    notifyListeners();
  }
}
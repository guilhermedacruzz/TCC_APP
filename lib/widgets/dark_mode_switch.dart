import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/utils/notifiers/provider_dark_theme.dart';

class SwitchDarkMode extends StatefulWidget {
  const SwitchDarkMode({Key? key}) : super(key: key);

  @override
  State<SwitchDarkMode> createState() => _SwitchDarkModeState();
}

class _SwitchDarkModeState extends State<SwitchDarkMode> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ProviderDarkTheme>(context);
    bool _value = themeChange.darkTheme;

    _changeTheme() {
      _value = !_value;
      themeChange.darkTheme = _value;
    }

    return IconButton(
      onPressed: () {
        _changeTheme();
      },
      icon: _value ? const Icon(Icons.dark_mode) : const Icon(Icons.light_mode),
    );
  }
}

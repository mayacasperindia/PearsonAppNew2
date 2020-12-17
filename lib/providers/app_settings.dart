import 'package:flutter/material.dart';
import 'package:pearson_flutter/utils/session.dart';

class AppSettings with ChangeNotifier {
  int _expandedIndex;
  ThemeMode _themeMode;
  Locale _locale;
  double _textScale;
  String _fontName;
  int _color;

  ThemeMode _getThemeMode(int index) {
    switch (index) {
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Locale _getLocale(String code) {
    switch (code) {
      case "es":
        return Locale("es");
      case "en":
        return Locale("en");
      default:
        return null;
    }
  }

  double get textScale => _textScale ?? Session.fontSize;

  String get fontName => _fontName ?? Session.fontName;

  int get color => _color ?? Session.color;

  int get expandedIndex => _expandedIndex;

  ThemeMode get themeMode => _themeMode ?? _getThemeMode(Session.theme);

  Locale get locale => _locale ?? _getLocale(Session.locale);

  set textScale(double scaleFactor) {
    _textScale = scaleFactor;
    notifyListeners();
  }

  set fontName(String name) {
    _fontName = name;
    notifyListeners();
  }

  set color(int value) {
    _color = value;
    notifyListeners();
  }

  set expandedIndex(int index) {
    _expandedIndex = index;
    notifyListeners();
  }

  set locale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}

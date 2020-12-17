import 'package:pearson_flutter/i18n/translation_strings.dart';
import 'package:pearson_flutter/providers/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  String _getThemeMode(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return "system_default";
      case ThemeMode.light:
        return "light";
      case ThemeMode.dark:
        return "dark";
    }
  }

  String _getLocale(Locale code) {
    switch (code?.languageCode) {
      case "en":
        return "lang_en";
      case "hi":
        return "lang_hi";
      case "pa":
        return "lang_pa";
      default:
        return "system_default";
    }
  }

  var _themes = [
    AppSettingsOption(ThemeMode.system, "system_default"),
    AppSettingsOption(ThemeMode.light, "light"),
    AppSettingsOption(ThemeMode.dark, "dark"),
  ];

  var _languages = [
    AppSettingsOption(null, "system_default"),
    AppSettingsOption("en", "lang_en"),
    AppSettingsOption("hi", "lang_hi"),
    AppSettingsOption("pa", "lang_pa"),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, AppSettings settings, Widget child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              Translations.of(context).translate("settings"),
            ),
            // backgroundColor: Theme.of(context).secondaryHeaderColor,
            leading: IconButton(
              icon: Icon(Icons.keyboard_backspace),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    Translations.of(context).translate("theme"),
                  ),
                  onTap: () {
                    if (settings.expandedIndex == 0) {
                      settings.expandedIndex = null;
                    } else {
                      settings.expandedIndex = 0;
                    }
                  },
                  trailing: Icon(Icons.palette),
                  subtitle: Text(
                    Translations.of(context)
                        .translate(_getThemeMode(settings.themeMode)),
                  ),
                ),
                AnimatedContainer(
                  height: settings.expandedIndex == 0 ? 48 : 0,
                  duration: Duration(milliseconds: 300),
                  child: ListView.builder(
                    itemCount: _themes.length,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, int index) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ChoiceChip(
                        label: Text(
                          Translations.of(context)
                              .translate(_themes[index].title),
                        ),
                        selected: settings.themeMode == _themes[index].value,
                        onSelected: (selected) {
                          settings.themeMode = _themes[index].value;
                          settings.expandedIndex = null;
                        },
                      ),
                    ),
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  title: Text(
                    Translations.of(context).translate("language"),
                  ),
                  onTap: () {
                    if (settings.expandedIndex == 1) {
                      settings.expandedIndex = null;
                    } else {
                      settings.expandedIndex = 1;
                    }
                  },
                  trailing: Icon(Icons.translate),
                  subtitle: Text(
                    Translations.of(context)
                        .translate(_getLocale(settings.locale)),
                  ),
                ),
                AnimatedContainer(
                  height: settings.expandedIndex == 1 ? 48 : 0,
                  duration: Duration(milliseconds: 300),
                  child: ListView.builder(
                    itemCount: _languages.length,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, int index) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ChoiceChip(
                        label: Text(
                          Translations.of(context)
                              .translate(_languages[index].title),
                        ),
                        selected: settings.locale?.languageCode ==
                            _languages[index].value,
                        onSelected: (selected) {
                          settings.locale = _languages[index].value == null
                              ? null
                              : Locale(_languages[index].value);
                          settings.expandedIndex = null;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AppSettingsOption<T> {
  final T value;
  final String title;

  AppSettingsOption(this.value, this.title);
}

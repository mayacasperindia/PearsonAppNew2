
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:pearson_flutter/i18n/messages_en.dart' as en;
import 'package:pearson_flutter/i18n/messages_hi.dart' as hi;
import 'package:pearson_flutter/i18n/messages_pa.dart' as pa;

typedef Future<dynamic> LibraryLoader();

class Translations {
  static Future<Translations> load(Locale locale) {
    final String name =
        (locale.countryCode != null && locale.countryCode.isEmpty)
            ? locale.languageCode
            : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    Map<String, LibraryLoader> _deferredLibraries = {
      'hi': () => new Future.value(null),
      'pa': () => new Future.value(null),
      'en': () => new Future.value(null),
    };

    var availableLocale = Intl.verifiedLocale(
        localeName, (locale) => _deferredLibraries[locale] != null,
        onFailure: (_) => null);
    if (availableLocale == null) {
      Intl.defaultLocale = "en_US";
    }
    Intl.defaultLocale = localeName;
    return new Future.value(new Translations());
  }

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  Map<String, dynamic> _translations = {
    "en_US": en.messages,
    "hi_IN": hi.messages,
    "pa_IN": pa.messages,
  };

  String translate(String key, {arg}) {
    String string = _translations[Intl.defaultLocale ?? "en_US"][key] ?? "";
    if (arg != null) string = string?.replaceAll("{}", "$arg");
    return Intl.message(string);
  }
}

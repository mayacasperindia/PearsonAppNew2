import 'package:flutter/cupertino.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionUser {
  final String firstName;
  final String lastName;
  final String mobile;
  final String email;
  final String image;

  String get fullName {
    return "$firstName $lastName";
  }

  String get initial {
    if (firstName == null || firstName.isEmpty) return "";
    var term = firstName.substring(0, 1);
    if (lastName != null && lastName.isEmpty) {
      term += lastName.substring(0, 1);
    }
    return "$term".toUpperCase();
  }

  SessionUser(
      {this.firstName, this.lastName, this.mobile, this.email, this.image});

  factory SessionUser.fromJson(str) {
    if (str == null) return null;
    return SessionUser(
      firstName: str["first_name"],
      lastName: str["last_name"],
      mobile: str["mobile"],
      email: str["email"],
      image: str["image"],
    );
  }
}

class SessionLocation {
  final String address;
  final double latitude;
  final double longitude;

  SessionLocation(this.address, this.latitude, this.longitude);
}

class Session {
  static SharedPreferences _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  //Settings
  static String get fontName =>
      _pref?.getString("app_fontName") ?? "Josefin Sans";

  static double get fontSize => _pref?.getDouble("app_fontSize") ?? 1.0;

  static int get color =>
      _pref?.getInt("app_color") ?? AppConfig.kAccentColor?.value;

  static int get theme => _pref?.getInt("app_theme") ?? 0;

  static String get locale => _pref?.getString("app_locale");

  static set fontName(String v) => _pref?.setString("app_fontName", v);

  static set fontSize(double v) => _pref?.setDouble("app_fontSize", v);

  static set color(int v) => _pref?.setInt("app_color", v);

  static set theme(int v) => _pref?.setInt("app_theme", v);

  static set locale(String v) => _pref?.setString("app_locale", v);

  static logout() => _pref?.clear();
}

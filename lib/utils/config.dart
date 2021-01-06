import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pearson_flutter/utils/page_routes.dart';
import 'package:pearson_flutter/utils/session.dart';
import 'package:url_launcher/url_launcher.dart';

class AppConfig {
  static Color kHeaderColor = Color(0xff027a9c);
  static Color kAccentColor = Color(0xff027a9c);
  static Color kHintColor = Color(0xffdedede);
  static Color kDividerColor = Color(0xffbcbcbc);
  static Color kErrorColor = Color(0xffcd0909);
  static Color kBackgroundColor = Color(0xfff1f1f9);

  //Dark theme
  static Color kHeaderColorDark = Color(0xff027a9c);
  static Color kAccentColorDark = Color(0xff027a9c);
  static Color kHintColorDark = Color(0xffdedede);
  static Color kDividerColorDark = Color(0xffbcbcbc);
  static Color kErrorColorDark = Color(0xffcd0909);

  static double kRadius = 50.0;
  static double kRadiusSmall = 10.0;
  static double kRadiusSmallest = 5.0;

  static MaterialColor kSwatch = MaterialColor(0xff202023, {
    50: Color(0xffe7e7e9),
    100: Color(0xffd0d0d4),
    200: Color(0xffa2a2aa),
    300: Color(0xff74747f),
    400: Color(0xff4a4a51),
    500: Color(0xff202023),
    600: Color(0xff1c1c1f),
    700: Color(0xff19191c),
    800: Color(0xff161618),
    900: Color(0xff131315),
  });

  Future<bool> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
      return true;
    }
    throw "Link not valid!";
  }

  static Future logout(BuildContext context) {
    Session.logout();
    return Navigator.pushNamedAndRemoveUntil(
      context,
      "/login",
      ModalRoute.withName("/splash"),
    );
  }

  static Future goto(BuildContext context, Widget page,
      {bool replace = false}) {
    if (replace) {
      return Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (_) => page),
      );
    }
    return Navigator.push(
      context,
      CupertinoPageRoute(builder: (_) => page),
    );
  }

  static Future popGoto(BuildContext context, Widget page) {
    return Navigator.pushAndRemoveUntil(
        context, CupertinoPageRoute(builder: (_) => page), (v) => true);
  }

  static Future animateTo(BuildContext context, Widget page) => Navigator.push(
        context,
        HeroDialogRoute(builder: (_) => page),
      );

  static void showSnackBar(String message,
      {BuildContext context,
      GlobalKey<ScaffoldState> key,
      Color color = Colors.pink,
      IconData icon}) {
    var snackBar = SnackBar(
      behavior: SnackBarBehavior.fixed,
      padding: EdgeInsets.symmetric(horizontal: 10),
      elevation: 0,
      content: ClipRRect(
        borderRadius: BorderRadius.circular(AppConfig.kRadiusSmallest),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: color ?? Colors.red[700],
                width: 10,
              ),
            ),
            color: kSwatch[900],
          ),
          child: Material(
            color: Colors.transparent,
            child: Row(
              children: <Widget>[
                SizedBox(width: 10),
                Icon(
                  icon ?? Icons.warning,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    message ?? "n/a",
                    maxLines: 3,
                    style: Theme.of(context).textTheme.body1.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.close),
                    color: Colors.white,
                    onPressed: () {
                      if (key == null) {
                        Scaffold.of(context).hideCurrentSnackBar();
                      } else {
                        key.currentState.hideCurrentSnackBar();
                      }
                    })
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
    if (key == null) {
      Scaffold.of(context).showSnackBar(snackBar);
    } else {
      key.currentState.showSnackBar(snackBar);
    }
  }

  static Future<bool> presentMessage(
    BuildContext context, {
    @required String message,
    IconData icon,
    double iconSize,
    Color iconColor,
    String buttonText,
    Color buttonTint,
  }) {
    var _width = MediaQuery.of(context).size.width;
    return showGeneralDialog(
        barrierColor: Colors.black54,
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.translate(
            child: Opacity(
              opacity: a1.value,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        width: min(_width - 80, 320),
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius:
                              BorderRadius.circular(AppConfig.kRadiusSmall),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(height: 10),
                            Icon(
                              icon ?? Icons.info,
                              size: iconSize ?? 48,
                              color: iconColor ?? Colors.green,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                message ?? "",
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.2,
                              ),
                            ),
                            Divider(height: 1),
                            FractionallySizedBox(
                              widthFactor: 1,
                              child: SizedBox(
                                height: 48,
                                child: FlatButton(
                                  textColor: buttonTint ??
                                      Theme.of(context).accentColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  onPressed: () => Navigator.pop(context, true),
                                  child: Text(
                                    buttonText ?? "OK",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            offset: Offset(0, _width - (a1.value * _width)),
          );
        },
        transitionDuration: Duration(milliseconds: 150),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) => null);
  }

  static Future<bool> presentDialog(
    BuildContext context, {
    @required IconData icon,
    @required String title,
    @required String message,
    String positiveButtonText,
    String negativeButtonText,
    Color negativeTint,
    Color positiveTint,
    Color headerColor,
  }) {
    var _width = MediaQuery.of(context).size.width;
    return showGeneralDialog(
        barrierColor: Colors.black54,
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.translate(
            child: Opacity(
              opacity: a1.value,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        width: min(_width - 80, 320),
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius:
                              BorderRadius.circular(AppConfig.kRadiusSmall),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: headerColor ??
                                    Theme.of(context).secondaryHeaderColor,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(AppConfig.kRadiusSmall),
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                              width: double.maxFinite,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    icon ?? Icons.arrow_right,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        title ?? "",
                                        textScaleFactor: 1.3,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Text(
                                message ?? "",
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.2,
                              ),
                            ),
                            Divider(height: 1),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: SizedBox(
                                    height: 48,
                                    child: FlatButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      textColor: negativeTint ?? null,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero),
                                      child: Text(
                                        negativeButtonText ??
                                            "Cancel".toUpperCase(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 48,
                                  width: 0.5,
                                  color: Theme.of(context).dividerColor,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 48,
                                    child: FlatButton(
                                      textColor: positiveTint ??
                                          Theme.of(context).accentColor,
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero),
                                      child: Text(
                                        positiveButtonText ??
                                            "Submit".toUpperCase(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            offset: Offset(0, _width - (a1.value * _width)),
          );
        },
        transitionDuration: Duration(milliseconds: 150),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) => null);
  }

  static Future<T> presentDialogWithChild<T>(BuildContext context, Widget child,
      {EdgeInsets margin, Color barrierColor}) {
    var _width = MediaQuery.of(context).size.width;
    return showGeneralDialog<T>(
        barrierColor: barrierColor ?? Colors.black38,
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.translate(
            child: Opacity(
              opacity: a1.value,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: margin ?? EdgeInsets.all(15),
                      child: child,
                    ),
                  ),
                ),
              ),
            ),
            offset: Offset(0, _width - (a1.value * _width)),
          );
        },
        transitionDuration: Duration(milliseconds: 150),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) => null);
  }
}

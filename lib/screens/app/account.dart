import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/screens/registration/account_setting.dart';
import 'package:pearson_flutter/screens/registration/add_voucher.dart';
import 'package:pearson_flutter/utils/config.dart';

import '../registration/login.dart';

enum AccountMenu { voucher, lang_en, lang_hi, logout }

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool _showMoreInfo = false;
  String _language = "English";
  List<String> _languages = ["English", "हिन्दी"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 56, bottom: 15),
        child: Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: "account",
            child: Material(
              borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
              clipBehavior: Clip.hardEdge,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Material(
                      // color: Theme.of(context).backgroundColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 5),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Expanded(
                                child: Align(
                                  alignment: Alignment(0, 0),
                                  child: Image.asset(
                                    "assets/images/logo.png",
                                    height: 28,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  FluentSystemIcons.ic_fluent_dismiss_filled,
                                  size: 20,
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                              SizedBox(width: 5),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 20,
                                  child: Icon(FluentSystemIcons
                                      .ic_fluent_person_filled),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pearson User',
                                        textScaleFactor: 1.2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'user@example.com',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                ExpandIcon(
                                  isExpanded: _showMoreInfo,
                                  onPressed: (expand) {
                                    setState(
                                        () => _showMoreInfo = !_showMoreInfo);
                                  },
                                ),
                              ],
                            ),
                          ),
                          AnimatedCrossFade(
                            firstChild: SizedBox.shrink(),
                            secondChild: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(width: 15),
                                              Icon(
                                                FluentSystemIcons
                                                    .ic_fluent_notebook_filled,
                                                size: 16,
                                              ),
                                              SizedBox(width: 10),
                                              Flexible(
                                                child: Text(
                                                  'Class: XII',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              SizedBox(width: 15),
                                              Icon(
                                                FluentSystemIcons
                                                    .ic_fluent_phone_filled,
                                                size: 16,
                                              ),
                                              SizedBox(width: 10),
                                              Flexible(
                                                child: Text(
                                                  '9876543210',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        FluentSystemIcons.ic_fluent_edit_filled,
                                      ),
                                      onPressed: () {
                                        AppConfig.goto(context, AccountSetting());

                                      },
                                      color: Theme.of(context).accentColor,
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                            crossFadeState: _showMoreInfo
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: Duration(milliseconds: 300),
                          )
                        ],
                      ),
                    ),
                    Divider(height: 1),
                    InkWell(
                      onTap: () {
                        AppConfig.goto(context, DialogPopup2());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(FluentSystemIcons.ic_fluent_gift_filled),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Voucher'.toUpperCase(),
                                    textScaleFactor: 0.9,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                    'Add Voucher',
                                    textScaleFactor: 0.9,
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(height: 1, indent: 48),
                    PopupMenuButton(
                      initialValue: _language,
                      offset: Offset(1, 0),
                      onSelected: (v) {
                        setState(() => _language = v);
                      },
                      itemBuilder: (_) => _languages
                          .map(
                            (e) => PopupMenuItem(
                              child: Text("$e"),
                              value: e,
                            ),
                          )
                          .toList(),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(FluentSystemIcons.ic_fluent_translate_filled),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Language'.toUpperCase(),
                                    textScaleFactor: 0.9,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                    '$_language',
                                    textScaleFactor: 0.9,
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                      ),
                    ),
                    Divider(height: 1),
                    FlatButton(
                      onPressed: () {
                        _logoutDialog(context);
                      },
                      child: Padding(

                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Icon(
                              FluentSystemIcons.ic_fluent_sign_out_filled,
                              color: Colors.red,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Logout'.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _logoutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Information !!!'),
            content: Text(
              'Are you sure want to logout?',
              style: TextStyle(color: Colors.red),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext ctx) => LoginPage())),
                  child: Text('OK')),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancel')),
            ],
          );
        });
  }
}

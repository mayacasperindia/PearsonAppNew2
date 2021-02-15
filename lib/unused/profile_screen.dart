import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/screens/registration/login.dart';
import 'package:pearson_flutter/utils/config.dart';

enum AccountMenu { voucher, lang_en, lang_hi, logout }

class ProfileScreen extends StatefulWidget {
  final ScrollController scrollController;
  final Function(AccountMenu menu) onMenuTap;

  const ProfileScreen({Key key, this.scrollController, this.onMenuTap})
      : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _showMoreInfo = false;
  String _language = "English";
  List<String> _languages = ["English", "हिन्दी"];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Material(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppConfig.kRadiusSmall),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: Icon(CupertinoIcons.person_solid),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pearson',
                              textScaleFactor: 1.2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'pearson@gmail.com',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      ExpandIcon(
                        isExpanded: _showMoreInfo,
                        onPressed: (expand) {
                          setState(() => _showMoreInfo = !_showMoreInfo);
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
                      Divider(height: 1),
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
                                      CupertinoIcons.book,
                                      size: 20,
                                    ),
                                    SizedBox(width: 10),
                                    Flexible(
                                      child: Text(
                                        'Class: XII',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    SizedBox(width: 15),
                                    Icon(
                                      CupertinoIcons.device_phone_portrait,
                                      size: 20,
                                    ),
                                    SizedBox(width: 10),
                                    Flexible(
                                      child: Text(
                                        '9876543210',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(CupertinoIcons.pencil_circle_fill),
                            onPressed: () {},
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
          Expanded(
            child: SingleChildScrollView(
              controller: widget.scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(height: 1),
                  InkWell(
                    onTap: () {
                      widget.onMenuTap(AccountMenu.voucher);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(CupertinoIcons.gift),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Voucher'.toUpperCase(),
                                  textScaleFactor: 0.9,
                                  style: Theme.of(context).textTheme.bodyText1,
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
                          Icon(Icons.translate),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Language'.toUpperCase(),
                                  textScaleFactor: 0.9,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                  '$_language',
                                  textScaleFactor: 0.9,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                  ),
                  Divider(height: 1),
                  InkWell(
                    onTap: () {
                      widget.onMenuTap(AccountMenu.logout);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
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
        ],
      ),
    );
  }
}

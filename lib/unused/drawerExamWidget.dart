import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/screens/chapterTestPractice.dart';
import 'package:pearson_flutter/screens/diagnosis/diagnosis_home.dart';
import 'package:pearson_flutter/screens/registration/login.dart';
import 'package:pearson_flutter/screens/test_series/non_proctored_test.dart';
import 'package:pearson_flutter/screens/practice/unit_test.dart';

class DrawerExamWidget extends StatefulWidget {
  @override
  _DrawerExamWidgetState createState() => _DrawerExamWidgetState();
}

class _DrawerExamWidgetState extends State<DrawerExamWidget> {
  bool _showMoreInfo = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Material(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.only(bottom: 10),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/background.jpg",
                              fit: BoxFit.cover,
                              width: double.maxFinite,
                              height: double.maxFinite,
                            ),
                          ),
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'pearson@gmail.com',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        ExpandIcon(
                          isExpanded: _showMoreInfo,
                          onPressed: (expand) {
                            setState(() => _showMoreInfo = !_showMoreInfo);
                          },
                          color: Colors.white,
                        ),
                      ],
                    ),
                    AnimatedCrossFade(
                      firstChild: SizedBox.shrink(),
                      secondChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(color: Colors.white30),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(
                                CupertinoIcons.book_solid,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  'Class: XII',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(
                                Icons.smartphone,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  '9876543210',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Icon(Icons.home),
                        title: Text('Diagnose'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DiagnoseHome(),
                              ));
                        },
                      ),
                      ExpansionTile(
                        title: Text('Practice'),
                        leading: Icon(Icons.pages),
                        children: [
                          ListTile(
                            leading: Icon(Icons.account_box),
                            title: Text('Chapter Test'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ChapterTestPracticeScreen(),
                                  ));
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.pages),
                            title: Text('Unit Test'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UnitTest(),
                                  ));
                            },
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: Text('Test Series'),
                        leading: Icon(Icons.featured_play_list),
                        children: [
                          ListTile(
                            leading: Icon(Icons.pages),
                            title: Text('Proctored Test'),
                            onTap: () => _popupDialog(context),
                          ),
                          ListTile(
                            leading: Icon(Icons.add_box_rounded),
                            title: Text('Non-Proctored Test'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NonProctoredTest(),
                                  ));
                            },
                          ),
                        ],
                      ),
                      ListTile(
                        leading: Icon(Icons.help),
                        title: Text('Report'),
                      ),
                      Divider(
                        height: 10,
                        thickness: 2,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        title: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        onTap: () async {
                          return _logoutDialog(context);

                          // SharedPreferences prefs = await SharedPreferences.getInstance();
                          // prefs.remove('email');
                          // prefs.remove('password');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _popupDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Information !!!'),
            content: Text(
              'Proctor tests will be enabled soon.',
              style: TextStyle(color: Colors.red),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK')),
            ],
          );
        });
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

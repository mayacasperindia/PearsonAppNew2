import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pearson_flutter/screens/app/account.dart';
import 'package:pearson_flutter/screens/diagnosis/diagnosis_home.dart';
import 'package:pearson_flutter/screens/practice/practice_home.dart';
import 'package:pearson_flutter/screens/report/reports.dart';
import 'package:pearson_flutter/screens/test_series/test_series_home.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  final String subject;

  HomePage({this.subject});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email;

  int _currentIndex = 0;

  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<String> _syllabus = [
    'NEET XI',
    'NEET XII',
    'Foundation IX',
    'Foundation X',
    'JEE Main XI',
    'JEE Main XII',
    'JEE Advanced XI',
    'JEE Advanced XII',
  ];

  Widget get _page {
    switch (_currentIndex) {
      case 1:
        return PracticeHome(
          // syllabus: _syllabus,
          onAccountTap: _onAccountTap,
        );
      case 2:
        return TestSeriesHome(
          // syllabus: _syllabus,
          onAccountTap: _onAccountTap,
        );
      case 3:
        return Reports(
          // syllabus: _syllabus,
          onAccountTap: _onAccountTap,
        );

      default:
        return DiagnoseHome(
          syllabus: _syllabus,
          onAccountTap: _onAccountTap,
        );
    }
  }

    _onAccountTap() async {
    var res = await AppConfig.animateTo(context, Account());
  }

  _accountMenuTap(AccountMenu menu) {
    _panelController.close();
    switch (menu) {
      case AccountMenu.voucher:
        // TODO: Handle this case.
        break;
      case AccountMenu.lang_en:
        // TODO: Handle this case.
        break;
      case AccountMenu.lang_hi:
        // TODO: Handle this case.
        break;
      case AccountMenu.logout:
        AppConfig.presentDialog(
          context,
          icon: FluentSystemIcons.ic_fluent_sign_out_filled,
          title: "Logout?",
          message: "Do you really want to logout?",
          positiveButtonText: "Logout".toUpperCase(),
          positiveTint: Colors.red,
          headerColor: Colors.red,
        );
        break;
    }
  }

  double _offset = 0.0;

  _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Theme.of(context).accentColor,
        unselectedItemColor: Theme.of(context).hintColor,
        onTap: _onTap,
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_document_search_filled),
            label: "Diagnose",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_document_edit_filled),
            label: "Practice",
          ),
          BottomNavigationBarItem(
            icon:
                Icon(FluentSystemIcons.ic_fluent_notebook_question_mark_filled),
            label: "Test Series",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_document_endnote_filled),
            label: "Report",
          ),
        ],
      ),
      body: _page,
    );
  }

  /*
  SlidingUpPanel(
        body: Padding(
          padding: EdgeInsets.only(bottom: 60),
          child: _page,
        ),
        minHeight: 60,
        maxHeight: 300,
        parallaxEnabled: true,
        backdropEnabled: true,
        collapsed: Row(
          children: [
            Expanded(
              child: BottomItem(
                icon: CupertinoIcons.doc_text_search,
                title: "Diagnosis",
                selected: _currentIndex == 0,
                onTap: () => _onTap(0),
              ),
            ),
            Expanded(
              child: BottomItem(
                icon: CupertinoIcons.pencil_outline,
                title: "Practice",
                selected: _currentIndex == 1,
                onTap: () => _onTap(1),
              ),
            ),
            Expanded(
              child: BottomItem(
                icon: CupertinoIcons.book,
                title: "Test Series",
                selected: _currentIndex == 2,
                onTap: () => _onTap(2),
              ),
            ),
            Expanded(
              child: BottomItem(
                icon: CupertinoIcons.lab_flask,
                title: "Report",
                selected: _currentIndex == 3,
                onTap: () => _onTap(3),
              ),
            ),
            Expanded(
              child: BottomItem(
                icon: CupertinoIcons.person,
                title: "Profile",
                selected: _currentIndex == 4,
                onTap: () => _panelController.open(),
              ),
            ),
          ],
        ),
        onPanelSlide: (offset) {
          setState(() => _offset = offset);
        },
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppConfig.kRadiusSmall),
        ),
        controller: _panelController,
        panelBuilder: (c) => Padding(
          padding: EdgeInsets.only(top: (1 - _offset) * 60),
          child: Account(),
        ),
      )
   */
  _goto(Widget page) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (_) => page),
    );
    // _panelController.animatePanelToPosition(2.0, curve: Curves.easeInToLinear);
  }
}

class BottomItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const BottomItem(
      {Key key, this.icon, this.title, this.selected = false, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 60,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Icon(
                icon,
                color: selected
                    ? Theme.of(context).buttonColor
                    : Theme.of(context).hintColor,
              ),
            ),
            SizedBox(height: 5),
            Text(
              title,
              textScaleFactor: 0.9,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: selected
                    ? Theme.of(context).buttonColor
                    : Theme.of(context).hintColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

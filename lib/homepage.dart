import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pearson_flutter/screens/app/account.dart';
import 'package:pearson_flutter/screens/diagnosis/diagnosis_home.dart';
import 'package:pearson_flutter/screens/practice/chapter_test.dart';
import 'package:pearson_flutter/screens/practice/practice_home.dart';
import 'package:pearson_flutter/screens/practice/previous_year_paper.dart';
import 'package:pearson_flutter/screens/practice/unit_test.dart';
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
  PageController _pageController;
  String _selectedSyllabus;

  @override
  void initState() {
    _pageController = PageController();
    _selectedSyllabus = _syllabus[0];
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

  _onSyllabusChange(String v) => setState(() => _selectedSyllabus = v);

  Widget get _page {
    switch (_index) {
      case 1:
        switch (_practiceIndex) {
          case 1:
            return UnitTest(
              syllabus: _syllabus,
              onSyllabusChange: _onSyllabusChange,
              onAccountTap: _onAccountTap,
            );
          case 2:
            return PreviousYearPaper(
              syllabus: _syllabus,
              onSyllabusChange: _onSyllabusChange,
              onAccountTap: _onAccountTap,
            );
          default:
            return ChapterTest(
              syllabus: _syllabus,
              onSyllabusChange: _onSyllabusChange,
              onAccountTap: _onAccountTap,
            );
        }
        break;
      case 2:
        return TestSeriesHome(
          syllabus: _syllabus,
          onAccountTap: _onAccountTap,
        );
      case 3:
        return Reports(
          syllabus: _syllabus,
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

  int _index = 0;

  _onTap(int index) async {
    setState(() {
      _index = index;
      if (index == 1) {
        _selectedSyllabus = _syllabus[0];
        _expandPractice = !_expandPractice;
      } else {
        _expandPractice = false;
      }
    });
  }

  _onPracticeTap(int index) {
    setState(() {
      _practiceIndex = index;
      _expandPractice = false;
    });
  }

  int _practiceIndex = 0;
  bool _expandPractice = false;

  @override
  Widget build(BuildContext context) {
    print(_index);
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: BottomItem(
                  icon: FluentSystemIcons.ic_fluent_document_search_filled,
                  title: "Diagnosis",
                  selected: _index == 0,
                  onTap: () => _onTap(0),
                ),
              ),
              Expanded(
                child: BottomItem(
                  icon: FluentSystemIcons.ic_fluent_document_edit_filled,
                  title: "Practice",
                  expanded: _expandPractice,
                  backgroundColor: _expandPractice
                      ? Theme.of(context).backgroundColor
                      : null,
                  selected: _index == 1,
                  onTap: () => _onTap(1),
                ),
              ),
              Expanded(
                child: BottomItem(
                  icon:
                      FluentSystemIcons.ic_fluent_notebook_question_mark_filled,
                  title: "Test Series",
                  selected: _index == 2,
                  onTap: () => _onTap(2),
                ),
              ),
              Expanded(
                child: BottomItem(
                  icon: FluentSystemIcons.ic_fluent_document_endnote_filled,
                  title: "Report",
                  selected: _index == 3,
                  onTap: () => _onTap(3),
                ),
              ),
            ],
          ),
          AnimatedContainer(
            color: Theme.of(context).backgroundColor,
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.all(10),
            height: _expandPractice ? 72 : 0,
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(
                    child: BottomItemBordered(
                      icon: FluentSystemIcons.ic_fluent_notebook_regular,
                      title: "Chapter Test",
                      selected: _practiceIndex == 0,
                      onTap: () => _onPracticeTap(0),
                    ),
                  ),
                  Expanded(
                    child: BottomItemBordered(
                      icon: FluentSystemIcons.ic_fluent_tap_single_regular,
                      title: "Unit Test",
                      selected: _practiceIndex == 1,
                      onTap: () => _onPracticeTap(1),
                    ),
                  ),
                  if (_selectedSyllabus.contains("II"))
                    Expanded(
                      child: BottomItemBordered(
                        icon: FluentSystemIcons.ic_fluent_previous_regular,
                        title: "Previous Year Paper",
                        selected: _practiceIndex == 2,
                        onTap: () => _onPracticeTap(2),
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
      body: _page,
    );
  }
}

class BottomItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final VoidCallback onTap;
  final Color backgroundColor;
  final bool expanded;

  const BottomItem({
    Key key,
    this.icon,
    this.title,
    this.selected = false,
    this.onTap,
    this.backgroundColor,
    this.expanded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SizedBox(
          height: 60,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          icon,
                          color: selected
                              ? Theme.of(context).accentColor
                              : Theme.of(context).hintColor,
                        ),
                        if (expanded != null)
                          SizedBox(
                            width: 20,
                            child: ExpandIcon(
                              isExpanded: expanded ?? false,
                              padding: EdgeInsets.zero,
                              onPressed: null,
                              disabledColor: selected
                                  ? Theme.of(context).accentColor
                                  : Theme.of(context).hintColor,
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    title,
                    textScaleFactor: 0.9,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: selected
                          ? Theme.of(context).accentColor
                          : Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomItemBordered extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const BottomItemBordered(
      {Key key, this.icon, this.title, this.selected = false, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = selected
        ? Theme.of(context).accentColor
        : Theme.of(context).dividerColor;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        height: 50,
        child: Material(
          color: color.withOpacity(0.2),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: color),
            borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
          ),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Icon(
                      icon,
                      color: selected
                          ? Theme.of(context).accentColor
                          : Theme.of(context).hintColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    title,
                    textScaleFactor: 0.9,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: selected
                          ? Theme.of(context).accentColor
                          : Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

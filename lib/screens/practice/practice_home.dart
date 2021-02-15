import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pearson_flutter/screens/practice/chapter_test.dart';
import 'package:pearson_flutter/screens/practice/previous_year_paper.dart';
import 'package:pearson_flutter/screens/practice/unit_test.dart';
import 'package:pearson_flutter/screens/test_series/non_proctored_test.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/syllabus_picker.dart';

class PracticeHome extends StatefulWidget {
  final List<String> syllabus;
  final VoidCallback onAccountTap;

  const PracticeHome({Key key, this.syllabus, this.onAccountTap})
      : super(key: key);

  @override
  _PracticeHomeState createState() => _PracticeHomeState();
}

class _PracticeHomeState extends State<PracticeHome> {
  String _selectedSyllabus;
  var _items = ["Chapter Test", "Unit Test", "Previous Year Papers"];

  @override
  void initState() {
    if (widget.syllabus?.isNotEmpty ?? false)
      _selectedSyllabus = widget.syllabus[0];
    super.initState();
  }

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          [
            ChapterTest(
              onAccountTap: widget.onAccountTap,
              syllabus: widget.syllabus,
              onSyllabusChange: (v) {
                setState(() {
                  _selectedSyllabus = v;
                });
              },
            ),
            UnitTest(
              onAccountTap: widget.onAccountTap,
              syllabus: widget.syllabus,
              onSyllabusChange: (v) {
                setState(() {
                  _selectedSyllabus = v;
                });
              },
            ),
            PreviousYearPaper(
              onAccountTap: widget.onAccountTap,
              syllabus: widget.syllabus,
              onSyllabusChange: (v) {
                setState(() {
                  _selectedSyllabus = v;
                });
              },
            ),
          ][_index],
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FluentSystemIcons.ic_fluent_book_formula_date_filled),
        backgroundColor: AppConfig.kFlagColor,
        onPressed: _openFilter,
      ),
    );
  }

  _openFilter() {
    var items = <String>[];
    items.clear();
    if (_selectedSyllabus.contains("XII")) {
      items.addAll(_items);
    } else {
      items.addAll(_items.take(2));
    }
    AppConfig.presentDialogWithChild(
      context,
      Filter(tests: items, selected: _index),
    ).then((value) {
      if (value is int) {
        setState(() {
          _index = value;
        });
      }
    });
  }
}

class Filter extends StatelessWidget {
  final int selected;
  final List<String> tests;

  const Filter({Key key, this.selected = 0, this.tests}) : super(key: key);

  _buildTrailing(BuildContext context, [selected = false]) {
    if (selected)
      return Icon(
        FluentSystemIcons.ic_fluent_checkmark_circle_filled,
        color: Theme.of(context).accentColor,
      );
    return Icon(FluentSystemIcons.ic_fluent_checkmark_circle_regular);
  }

  @override
  Widget build(BuildContext context) {
    print(selected);
    return Align(
      alignment: Alignment(1, 0.85),
      child: Container(
        width: 240,
        child: Material(
          borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: tests
                    ?.map(
                      (e) => ListTile(
                        onTap: () {
                          Navigator.pop(context, tests.indexOf(e));
                        },
                        title: Text(
                          e,
                          style: TextStyle(
                            color: selected == tests.indexOf(e)
                                ? Theme.of(context).accentColor
                                : null,
                          ),
                        ),
                        selected: selected == tests.indexOf(e),
                        trailing: _buildTrailing(
                          context,
                          selected == tests.indexOf(e),
                        ),
                      ),
                    )
                    ?.toList() ??
                [],
          ),
        ),
      ),
    );
  }
}

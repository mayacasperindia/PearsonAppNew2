import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pearson_flutter/screens/practice/unit_test_item.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/syllabus_picker.dart';
import 'package:pearson_flutter/widgets/widgets.dart';
import 'package:pearson_flutter/unused/drawerExamWidget.dart';
import 'package:pearson_flutter/widgets/my_scaffold.dart';

class UnitTest extends StatefulWidget {
  final List<String> syllabus;
  final VoidCallback onAccountTap;

  const UnitTest({Key key, this.syllabus, this.onAccountTap}) : super(key: key);

  @override
  _UnitTestState createState() => _UnitTestState();
}

class _UnitTestState extends State<UnitTest> {
  String _selectedSyllabus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SyllabusPicker(
          syllabus: widget.syllabus,
          onChange: (v) {
            setState(() {
              _selectedSyllabus = v;
              globalSelectedSyllabus = v;
            });
          },
        ),
        actions: [
          Hero(
            tag: "account",
            child: Material(
              borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
              child: IconButton(
                onPressed: widget.onAccountTap,
                icon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 8,
        padding: EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) => UnitTestItem(
          enabled: index % 4 != 0,
        ),
      ),
    );
  }
}

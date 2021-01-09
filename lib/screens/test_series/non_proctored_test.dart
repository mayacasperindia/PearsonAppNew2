import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/screens/practice/proctored_test.dart';
import 'package:pearson_flutter/screens/practice/unit_test_item.dart';
import 'package:pearson_flutter/widgets/widgets.dart';
import 'package:pearson_flutter/unused/drawerExamWidget.dart';

class NonProctoredTest extends StatefulWidget {
  @override
  _NonProctoredTestState createState() => _NonProctoredTestState();
}

class _NonProctoredTestState extends State<NonProctoredTest> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      padding: EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (context, index) => ProctoredTestItem(
        enabled: index % 4 != 0,
      ),
    );
  }
}

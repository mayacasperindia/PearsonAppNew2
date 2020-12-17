import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pearson_flutter/screens/practice/unit_test_item.dart';
import 'package:pearson_flutter/widgets/widgets.dart';
import 'package:pearson_flutter/unused/drawerExamWidget.dart';
import 'package:pearson_flutter/widgets/my_scaffold.dart';

class UnitTest extends StatefulWidget {
  @override
  _UnitTestState createState() => _UnitTestState();
}

class _UnitTestState extends State<UnitTest> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      padding: EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (context, index) => UnitTestItem(
        enabled: index % 4 != 0,
      ),
    );
  }
}

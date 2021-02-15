import 'package:flutter/material.dart';
import 'package:pearson_flutter/screens/practice/proctored_test.dart';

class NonProctoredTest extends StatefulWidget {
  final bool topPadding;

  const NonProctoredTest({Key key, this.topPadding = false}) : super(key: key);

  @override
  _NonProctoredTestState createState() => _NonProctoredTestState();
}

class _NonProctoredTestState extends State<NonProctoredTest> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      padding: EdgeInsets.only(top: widget.topPadding ? 50 : 10, bottom: 10),
      itemBuilder: (context, index) => ProctoredTestItem(
        enabled: index % 4 != 0,
      ),
    );
  }
}

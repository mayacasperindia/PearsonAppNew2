import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/screens/diagnosis/diagnosis_subject_item.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/widgets.dart';

class DiagnoseSubject extends StatefulWidget {
  @override
  _DiagnoseSubjectState createState() => _DiagnoseSubjectState();
}

class _DiagnoseSubjectState extends State<DiagnoseSubject> {
  int _currentIndex;

  _callback(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 9,
      padding: EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (context, index) {
        return DiagnosisSubjectItem(
          index: index,
          expanded: index == _currentIndex,
          callback: _callback,
        );
      },
    );
  }
}

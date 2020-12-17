import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/screens/diagnosis/diagnosis_subject.dart';
import 'package:pearson_flutter/screens/diagnosis/diagnosis_subject_item.dart';
import 'package:pearson_flutter/utils/config.dart';

class ChapterTest extends StatefulWidget {
  @override
  _ChapterTestState createState() => _ChapterTestState();
}

class _ChapterTestState extends State<ChapterTest> {
  int _currentIndex;

  _callback(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (context, index) => DiagnosisSubjectItem(
        index: index,
        expanded: index == _currentIndex,
        callback: _callback,
      ),
    );
  }
}

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:pearson_flutter/unused/syllabus/questionAnswer.dart';

class SubjectScreen extends StatefulWidget {
  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10),
      itemCount: 10,
      itemBuilder: (context, index) => Card3(
        index: index,
      ),
    );
  }
}

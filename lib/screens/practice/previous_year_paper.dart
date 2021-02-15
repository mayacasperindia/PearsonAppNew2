import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/screens/test_series/non_proctored_test.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/syllabus_picker.dart';
import 'package:pearson_flutter/widgets/widgets.dart';

class PreviousYearPaper extends StatefulWidget {
  final List<String> syllabus;
  final VoidCallback onAccountTap;
  final Function(String syllabus) onSyllabusChange;

  const PreviousYearPaper(
      {Key key, this.syllabus, this.onAccountTap, this.onSyllabusChange})
      : super(key: key);

  @override
  _PreviousYearPaperState createState() => _PreviousYearPaperState();
}

class _PreviousYearPaperState extends State<PreviousYearPaper> {
  String _selectedSyllabus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/favicon.png"),
        titleSpacing: 0,
        title: SyllabusPicker(
          syllabus: widget.syllabus,
          onChange: (v) {
            setState(() {
              _selectedSyllabus = v;
            });
            if (widget.onSyllabusChange != null)
              widget.onSyllabusChange(_selectedSyllabus);
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
      body: NonProctoredTest(),
    );
  }
}

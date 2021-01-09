import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pearson_flutter/screens/practice/chapter_test.dart';
import 'package:pearson_flutter/screens/practice/unit_test.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/rtab_indicator.dart';
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
  @override
  void initState() {
    super.initState();
  }

  Widget makeTabBar() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CupertinoSegmentedControl(
        onValueChanged: (value) {
          setState(() => _index = value);
        },
        borderColor: Theme.of(context).iconTheme.color,
        selectedColor: Theme.of(context).canvasColor,
        groupValue: _index,
        unselectedColor: AppConfig.kSwatch[200],
        pressedColor: Theme.of(context).primaryColor,
        children: {
          0: Padding(
            child: Text("Chapter Test", style: TextStyle(
              color: Theme.of(context).buttonColor, fontWeight: FontWeight.w800
            ),),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          ),
          1: Padding(
            child: Text("Unit Test", style: TextStyle(
              color: Theme.of(context).buttonColor, fontWeight: FontWeight.w800
            ),),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          ),
          if(globalSelectedSyllabus == 'NEET XII' || globalSelectedSyllabus == 'JEE Main XII' || globalSelectedSyllabus == 'JEE Advanced XII' )
          2: Padding(
            child: Text("Previous Year Question", style: TextStyle(
              color: Theme.of(context).buttonColor, fontWeight: FontWeight.w800
            ),),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          ),
        },
      ),
    );
  }

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        [
          ChapterTest(
            onAccountTap: widget.onAccountTap,
            syllabus: widget.syllabus,
          ),
          UnitTest(
            onAccountTap: widget.onAccountTap,
            syllabus: widget.syllabus,
          ),
          if(globalSelectedSyllabus == 'NEET XII' || globalSelectedSyllabus == 'JEE Main XII' || globalSelectedSyllabus == 'JEE Advanced XII' )
            UnitTest(
            onAccountTap: widget.onAccountTap,
            syllabus: widget.syllabus,
          ),
        ][_index],
        Align(alignment: Alignment.bottomCenter, child: makeTabBar()),
      ],
    );
  }

  _goto(Widget page) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (_) => page),
    );
    // _panelController.animatePanelToPosition(0.0, curve: Curves.easeInToLinear);
  }
}

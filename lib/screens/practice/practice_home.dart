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
    _selectedChapter = 0;
    super.initState();
  }

  int _index = 0;
  int _selectedChapter;
  List<int> _practice = [
    0,
    1,
    if(globalSelectedSyllabus == 'NEET XII' || globalSelectedSyllabus == 'JEE Main XII' || globalSelectedSyllabus == 'JEE Advanced XII' )
      2,
  ];

  Widget makeSyllabusTab() {
    return PopupMenuButton(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 140, maxHeight: 48),
        child: FlatButton(
          onPressed: null,
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedChapter == 0 ? 'Chapter Test' : _selectedChapter == 1 ? 'Unit Test' : 'Previous Year' ?? "<select>",
                        maxLines: 1,
                        // textScaleFactor: 0.5,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
              Divider(height: 1),
            ],
          ),
          disabledTextColor: Theme
              .of(context)
              .iconTheme
              .color,
        ),
      ),
      onSelected: (value) {
        setState(() {
          _index = value;
          _selectedChapter = value;
        });
      },
      itemBuilder: (_) =>
      _practice
          ?.map(
            (e) =>
            PopupMenuItem(
              value: e,
              child: Text(e == 0 ? 'Chapter Test' : e == 1 ? 'Unit Test' : 'Previous Year', textScaleFactor: 0.7,),
            ),
      )
          ?.toList() ??
          [],
    );
  }




  //     Padding(
  //     padding: const EdgeInsets.all(10.0),
  //     child: CupertinoSegmentedControl(
  //       onValueChanged: (value) {
  //         setState(() => _index = value);
  //       },
  //       borderColor: Theme.of(context).iconTheme.color,
  //       selectedColor: Theme.of(context).canvasColor,
  //       groupValue: _index,
  //       unselectedColor: AppConfig.kSwatch[200],
  //       pressedColor: Theme.of(context).primaryColor,
  //       children: {
  //         0: Padding(
  //           child: Text("Chapter Test", style: TextStyle(
  //             color: Theme.of(context).buttonColor, fontWeight: FontWeight.w800
  //           ),),
  //           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
  //         ),
  //         1: Padding(
  //           child: Text("Unit Test", style: TextStyle(
  //             color: Theme.of(context).buttonColor, fontWeight: FontWeight.w800
  //           ),),
  //           padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
  //         ),
  //         if(globalSelectedSyllabus == 'NEET XII' || globalSelectedSyllabus == 'JEE Main XII' || globalSelectedSyllabus == 'JEE Advanced XII' )
  //         2: Padding(
  //           child: Text("Previous Year Question", style: TextStyle(
  //             color: Theme.of(context).buttonColor, fontWeight: FontWeight.w800
  //           ),),
  //           padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
  //         ),
  //       },
  //     ),
  //   );
  // }


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
        SafeArea(child: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Align(alignment: Alignment.topLeft, child: makeSyllabusTab()),
        )),
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

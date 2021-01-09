import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/screens/exercise/exerciseScreen.dart';
import 'package:pearson_flutter/screens/exercise/test_quiz.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/widgets.dart';

class PracticeTestItem extends StatelessWidget {
  final int index;

  final bool expanded;
  final Function(int index) callback;

  PracticeTestItem(
      {Key key, this.index, this.callback, this.expanded = false})
      : super(key: key) {
    _controller = ExpandableController(initialExpanded: expanded);
    _controller.addListener(() {
      if (_controller.expanded) {
        callback(index);
      }
    });
  }

  buildList(BuildContext context, [Color color]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < 3; i++)
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 0.5,
                ),
              ),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      color: color ?? Colors.indigo,
                      width: 4,
                      height: 12,
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Units and Measurements ${i + 1}'.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => AppConfig.goto(context, ExerciseScreen(chapter: true,)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(child: Text('Chapter 1')),
                                Text('65%'),
                              ],
                            ),
                            SizedBox(height: 5),
                            ClipRRect(
                              borderRadius:
                              BorderRadius.circular(AppConfig.kRadiusSmall),
                              child: LinearProgressIndicator(
                                minHeight: 12,
                                value: 0.65,
                                valueColor: AlwaysStoppedAnimation(
                                    color ?? Colors.indigo),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () => AppConfig.goto(context, ExerciseScreen(chapter: true,)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(child: Text('Chapter 2')),
                                Text('15%'),
                              ],
                            ),
                            SizedBox(height: 5),
                            ClipRRect(
                              borderRadius:
                              BorderRadius.circular(AppConfig.kRadiusSmall),
                              child: LinearProgressIndicator(
                                minHeight: 12,
                                value: 0.15,
                                valueColor: AlwaysStoppedAnimation(color ?? Colors.indigo),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }

  ExpandableController _controller;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).accentColor;
    var text = Theme.of(context).canvasColor;
    return ExpandableNotifier(
      controller: _controller,
      child: ScrollOnExpand(
        child: RCard(
          elevation: 0.5,
          shadowColor: color,
          child: Column(
            children: <Widget>[
              ExpandablePanel(
                theme: ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToExpand: true,
                  tapBodyToCollapse: true,
                  hasIcon: false,
                  useInkWell: true,
                  animationDuration: Duration(milliseconds: 500),
                ),
                header: Container(
                  // color: expanded ? Theme.of(context).dividerColor : null,
                  color: color,

                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${index + 1}",
                          textScaleFactor: 0.9,
                          style: TextStyle(color: color),
                        ),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: text,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "General Physics and Motion in a Straight Line",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: text),
                        ),
                      ),
                      SizedBox(width: 5),
                      ExpandIcon(
                        disabledColor: text,
                        onPressed: null,
                        isExpanded: _controller.expanded,
                      ),
                    ],
                  ),
                ),
                expanded: buildList(context, color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

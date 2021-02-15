import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/widgets.dart';

class AttemptTimeGraph extends StatefulWidget {
  @override
  _AttemptTimeGraph createState() => _AttemptTimeGraph();
}

class _AttemptTimeGraph extends State<AttemptTimeGraph> {
  int touchedIndex;
  var _questions = <AnswerAttempt>[];
  var _q = [
    {"q": "Question 1", "t": 34, "r": false},
    {"q": "Question 2", "t": 3, "r": true},
    {"q": "Question 3", "t": 12, "r": true},
    {"q": "Question 4", "t": 34, "r": false},
    {"q": "Question 5", "t": 4, "r": true},
    {"q": "Question 6", "t": 22, "r": false},
    {"q": "Question 7", "t": 17, "r": false},
    {"q": "Question 8", "t": 9, "r": false},
    {"q": "Question 9", "t": 23, "r": false},
    {"q": "Question 10", "t": 13, "r": false},
    {"q": "Question 11", "t": 31, "r": false},
    {"q": "Question 12", "t": 2, "r": true},
  ];

  _getData() {
    _questions.addAll(_q.map((e) => AnswerAttempt.fromJson(e)).toList());
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: RCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconLabel(Icons.bar_chart, "Time spend per question"),
            Divider(height: 1),
            SizedBox(height: 10),
            Expanded(
              child: Row(
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            FluentSystemIcons.ic_fluent_arrow_right_filled,
                            size: 16,
                          ),
                          SizedBox(width: 5),
                          Flexible(child: Text("Time")),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                          width: _questions.length * 32.0,
                          child: BarChart(mainBarData())),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FluentSystemIcons.ic_fluent_arrow_right_filled,
                    size: 16,
                  ),
                  SizedBox(width: 5),
                  Flexible(child: Text("Question")),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 5),
              child: Wrap(
                children: [
                  LegendTile("Correct", AppConfig.kSuccessColor),
                  LegendTile("Incorrect", AppConfig.kErrorColor),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.black,
    double width = 20,
    List<int> showTooltips = const [],
  }) {
    var touchColor = Theme.of(context).accentColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          borderRadius: BorderRadius.zero,
          colors: isTouched ? [touchColor] : [barColor],
          width: width,
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() {
    var rightColor = AppConfig.kSuccessColor;
    var wrongColor = AppConfig.kErrorColor;
    return List.generate(
      _questions.length,
      (index) => makeGroupData(
        index + 1,
        _questions[index].timeTaken.toDouble(),
        isTouched: index == touchedIndex,
        barColor: _questions[index].isRight ? rightColor : wrongColor,
      ),
    );
  }

  BarChartData mainBarData() {
    var textTheme = Theme.of(context).textTheme.caption.copyWith(fontSize: 12);
    return BarChartData(
      gridData: FlGridData(show: true, horizontalInterval: 5),
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Theme.of(context).iconTheme.color.withOpacity(0.8),
          fitInsideVertically: true,
          fitInsideHorizontally: true,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              "${_questions[groupIndex].question}\n${(rod.y - 1).toInt()}s",
              textTheme.copyWith(color: Colors.white),
            );
          },
        ),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! FlPanEnd &&
                barTouchResponse.touchInput is! FlLongPressEnd) {
              touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          margin: 5,
          getTitles: (v) => "${v.toInt()}",
          getTextStyles: (v) => textTheme,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 5,
          getTextStyles: (_) => textTheme,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
          left: BorderSide(),
          bottom: BorderSide(),
        ),
      ),
      barGroups: showingGroups(),
    );
  }
}

class AnswerAttempt {
  final String question;
  final int timeTaken;
  final bool isRight;

  AnswerAttempt({this.question, this.timeTaken, this.isRight});

  factory AnswerAttempt.fromJson(str) {
    if (str == null) return null;
    return AnswerAttempt(
      question: str["q"],
      timeTaken: str["t"],
      isRight: str["r"],
    );
  }
}

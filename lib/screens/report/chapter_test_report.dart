import 'package:expandable/expandable.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/homepage.dart';
import 'package:pearson_flutter/screens/exercise/answer_review.dart';
import 'package:pearson_flutter/screens/exercise/sampleQuestionModel.dart';
import 'package:pearson_flutter/screens/report/preview_question.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ChapterTestReport extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChapterTestReport({Key key, this.questions}) : super(key: key);

  @override
  _ChapterTestReportState createState() => _ChapterTestReportState();
}

class _ChapterTestReportState extends State<ChapterTestReport> {
  int _currentIndex;

  _callback(int index) {
    setState(() => _currentIndex = index);
  }

  int get _rightCount =>
      widget.questions
          .where((element) => element.answeredCorrect)
          .length;

  int get _wrongCount =>
      widget.questions
          .where((element) => element.answeredWrong)
          .length;

  int get _unAttendedCount =>
      widget.questions
          .where((element) => element.selectedAnswer == null)
          .length;

  String subjectValue = 'Physics';
  String chapterValue = 'Select Chapter';
  String testNameValue = 'Chapter test 1';
  String attemptValue = 'Attempt 1';


  @override
  Widget build(BuildContext context) {
    print(widget.questions);
    return WillPopScope(
        child: Scaffold(
          body: NestedScrollView(
            body: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Expanded(child:
                            DropdownButton<String>(
                              value: subjectValue,
                              underline: Container(),
                              isExpanded: true,
                              onChanged: (String newValue) {
                                setState(() {
                                  subjectValue = newValue;
                                });
                              },
                              items: <String>['Physics', 'Chemistry']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),),
                            Expanded(child: DropdownButton<String>(
                              underline: Container(),
                              value: chapterValue,
                              isExpanded: true,
                              itemHeight: 50,
                              onChanged: (String newValue) {
                                setState(() {
                                  chapterValue = newValue;
                                });
                              },
                              items: <String>['Select Chapter']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Container(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: Text(value)),
                                );
                              }).toList(),
                            ),),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(child: DropdownButton<String>(
                              isExpanded: true,
                              underline: Container(),
                              value: testNameValue,
                              onChanged: (String newValue) {
                                setState(() {
                                  testNameValue = newValue;
                                });
                              },
                              items: <String>['Chapter test 1']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),),
                            Expanded(child: DropdownButton<String>(
                              underline: Container(),
                              isExpanded: true,
                              value: attemptValue,
                              onChanged: (String newValue) {
                                setState(() {
                                  attemptValue = newValue;
                                });
                              },
                              items: <String>['Attempt 1']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 13),
                            decoration: BoxDecoration(
                              color: Theme
                                  .of(context)
                                  .accentColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text('Chapter Test Report', style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18,
                                color: Theme
                                    .of(context)
                                    .primaryColor
                            ),)),
                      ),
                    ],

                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.45,
                          padding: EdgeInsets.all(10),
                          child: CircularPercentIndicator(
                            radius: MediaQuery
                                .of(context)
                                .size
                                .width * 0.25,
                            lineWidth: 7,
                            animation: true,
                            percent: 45 / 45,
                            center: Text(
                              "45",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            footer: Text(
                              "TOTAL",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            backgroundColor: Colors.black12,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Theme
                                .of(context)
                                .buttonColor,
                          )),
                    ),
                    Expanded(
                      child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.45,
                          padding: EdgeInsets.all(10),
                          child: CircularPercentIndicator(
                            radius: MediaQuery
                                .of(context)
                                .size
                                .width * 0.25,
                            lineWidth: 7,
                            animation: true,
                            percent: 40 / 45,
                            center: Text(
                              "40",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            footer: Text(
                              "ATTEMPT",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            backgroundColor: Colors.black12,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.green,
                          )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.45,
                          padding: EdgeInsets.all(10),
                          child: CircularPercentIndicator(
                            radius: MediaQuery
                                .of(context)
                                .size
                                .width * 0.25,
                            lineWidth: 7,
                            animation: true,
                            percent: 5 / 45,
                            center: Text(
                              "5",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            footer: Text(
                              "SKIPPED",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            backgroundColor: Colors.black12,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.redAccent,
                          )),
                    ),
                    Expanded(
                      child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.45,
                          padding: EdgeInsets.all(10),
                          child: CircularPercentIndicator(
                            radius: MediaQuery
                                .of(context)
                                .size
                                .width * 0.25,
                            lineWidth: 7,
                            animation: true,
                            percent: 35 / 45,
                            center: Text(
                              "35",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            footer: Text(
                              "CORRECT",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            backgroundColor: Colors.black12,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.cyan,
                          )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.45,
                          padding: EdgeInsets.all(10),
                          child: CircularPercentIndicator(
                            radius: MediaQuery
                                .of(context)
                                .size
                                .width * 0.25,
                            lineWidth: 7,
                            animation: true,
                            percent: 45 / 45,
                            center: Text(
                              "30:00",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            footer: Text(
                              "TIME(MM:SS)",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            backgroundColor: Colors.black12,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.redAccent,
                          )),
                    ),
                    Expanded(
                      child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.45,
                          padding: EdgeInsets.all(10),
                          child: CircularPercentIndicator(
                            radius: MediaQuery
                                .of(context)
                                .size
                                .width * 0.25,
                            lineWidth: 7,
                            animation: true,
                            percent: 35 / 45,
                            center: Text(
                              "140/ 180",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            footer: Text(
                              "MARKS",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            backgroundColor: Colors.black12,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Theme
                                .of(context)
                                .buttonColor,
                          )),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 13),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
                    decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('Question Wise Report', style: Theme
                        .of(context)
                        .textTheme
                        .headline5
                        .copyWith(
                        color: Theme
                            .of(context)
                            .primaryColor
                    ),),),
                ),
                // Table(
                //   border: TableBorder.all(
                //       color: Colors.black,
                //       style: BorderStyle.none,
                //       width: 0,
                //       ),
                //   children: [
                //     TableRow( children: [
                //       Column(children:[Text('No', style: Theme.of(context).textTheme.headline5,)]),
                //       Column(children:[Text('Question', style: Theme.of(context).textTheme.headline5,)]),
                //       Column(children:[Text('Your Attempt', style: Theme.of(context).textTheme.headline5,)]),
                //       Column(children:[Text('Time per questions (mm:ss)', style: Theme.of(context).textTheme.headline5,)]),
                //       Column(children:[Text('Difficulty Level', style: Theme.of(context).textTheme.headline5,)]),
                //       Column(children:[Text('Congnitive Level', style: Theme.of(context).textTheme.headline5,)]),
                //       Column(children:[Text('', style: Theme.of(context).textTheme.headline5,)]),
                //     ]),
                //   ],
                // ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.4,
                    child: SingleChildScrollView(
                      // scrollDirection: Axis.horizontal,
                      child: Material(
                        child: DataTable(
                          // headingRowHeight: 40,
                          dataRowHeight: 100,
                          // showCheckboxColumn: false,
                          // dividerThickness: 0.3,

                          columns: [
                            DataColumn(label: Text('No', style: Theme
                                .of(context)
                                .textTheme
                                .headline6,)),
                            DataColumn(label: Text('Question', style: Theme
                                .of(context)
                                .textTheme
                                .headline6,)),
                            DataColumn(label: Text('Your Attempt', style: Theme
                                .of(context)
                                .textTheme
                                .headline6,)),
                            DataColumn(label: Text(
                              'Time per questions (mm:ss)', style: Theme
                                .of(context)
                                .textTheme
                                .headline6,)),
                            DataColumn(
                                label: Text('Difficulty Level', style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline6,)),
                            DataColumn(
                                label: Text('Congnitive Level', style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline6,)),
                            DataColumn(label: Text('', style: Theme
                                .of(context)
                                .textTheme
                                .headline6,)),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(Text('1')),
                              DataCell(Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.7,
                                  child: Text(
                                    'General Physics and Motion in a Seneral Physics and Motion in a Seneral Physics and Motion in a Seneral Physics and Motion in a Straight Line General Physics and Motion in a Straight Line General Physics and Motion in a Straight Line',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyText2,))),
                              DataCell(Icon(
                                Icons.check, color: AppConfig.kSuccessColor,)),
                              DataCell(Text('01:30')),
                              DataCell(Text('Difficult')),
                              DataCell(Text('Application')),
                              DataCell(Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FlatButton(
                                  onPressed: () {
                                    AppConfig.popGoto(
                                      context,
                                        PreviewQuestionAnswer(),
                                    );
                                  },
                                  color: AppConfig.kFlagColor,
                                  child: Text("Preview Question", style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                      color: Theme
                                          .of(context)
                                          .primaryColor
                                  )),
                                ),
                              )),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('2')),
                              DataCell(Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.7,
                                  child: Text(
                                    'General Physics and Motion in a Seneral Physics and Motion in a Seneral Physics and Motion in a Seneral Physics and Motion in a Straight Line General Physics and Motion in a Straight Line General Physics and Motion in a Straight Line',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyText2,))),
                              DataCell(Icon(Icons.close,
                                color: AppConfig.kErrorColorDark,)),
                              DataCell(Text('01:30')),
                              DataCell(Text('Difficult')),
                              DataCell(Text('Application')),
                              DataCell(Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FlatButton(
                                  onPressed: () {
                                    AppConfig.popGoto(
                                      context,
                                      PreviewQuestionAnswer(),
                                    );
                                  },
                                  color: AppConfig.kFlagColor,
                                  child: Text("Preview Question", style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                      color: Theme
                                          .of(context)
                                          .primaryColor
                                  )),
                                ),
                              )),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('3')),
                              DataCell(Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.7,
                                  child: Text(
                                    'General Physics and Motion in a Seneral Physics and Motion in a Seneral Physics and Motion in a Seneral Physics and Motion in a Straight Line General Physics and Motion in a Straight Line General Physics and Motion in a Straight Line',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyText2,))),
                              DataCell(Icon(
                                Icons.check, color: AppConfig.kSuccessColor,)),
                              DataCell(Text('01:30')),
                              DataCell(Text('Difficult')),
                              DataCell(Text('Application')),
                              DataCell(Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FlatButton(
                                  onPressed: () {
                                    AppConfig.popGoto(
                                      context,
                                      PreviewQuestionAnswer(),
                                    );
                                  },
                                  color: AppConfig.kFlagColor,
                                  child: Text("Preview Question", style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                      color: Theme
                                          .of(context)
                                          .primaryColor
                                  )),
                                ),
                              )),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('4')),
                              DataCell(Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.7,
                                  child: Text(
                                    'General Physics and Motion in a Seneral Physics and Motion in a Seneral Physics and Motion in a Seneral Physics and Motion in a Straight Line General Physics and Motion in a Straight Line General Physics and Motion in a Straight Line',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyText2,))),
                              DataCell(Icon(Icons.close,
                                color: AppConfig.kErrorColorDark,)),
                              DataCell(Text('01:30')),
                              DataCell(Text('Difficult')),
                              DataCell(Text('Application')),
                              DataCell(Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FlatButton(
                                  onPressed: () {
                                    AppConfig.popGoto(
                                      context,
                                      PreviewQuestionAnswer(),
                                    );
                                  },
                                  color: AppConfig.kFlagColor,
                                  child: Text("Preview Question", style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                      color: Theme
                                          .of(context)
                                          .primaryColor
                                  )),
                                ),
                              )),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('5')),
                              DataCell(Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.7,
                                  child: Text(
                                    'General Physics and Motion in a Seneral Physics and Motion in a Seneral Physics and Motion in a Seneral Physics and Motion in a Straight Line General Physics and Motion in a Straight Line General Physics and Motion in a Straight Line',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyText2,))),
                              DataCell(Icon(
                                Icons.check, color: AppConfig.kSuccessColor,)),
                              DataCell(Text('01:30')),
                              DataCell(Text('Difficult')),
                              DataCell(Text('Application')),
                              DataCell(Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FlatButton(
                                  onPressed: () {
                                    AppConfig.popGoto(
                                      context,
                                      PreviewQuestionAnswer(),
                                    );
                                  },
                                  color: AppConfig.kFlagColor,
                                  child: Text("Preview Question", style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                      color: Theme
                                          .of(context)
                                          .primaryColor
                                  )),
                                ),
                              )),
                            ]),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 13),
                            decoration: BoxDecoration(
                              color: Theme
                                  .of(context)
                                  .accentColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text('Topic-wise Report ',
                              style: Theme.of(context).textTheme.headline6.copyWith(color: Theme.of(context).primaryColor),
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("All Subjects ", style: Theme
                                .of(context)
                                .textTheme
                                .body1
                                .copyWith(
                              fontWeight: FontWeight.bold,
                            ),),
                            Text("Total Question : 45", style: Theme
                                .of(context)
                                .textTheme
                                .body1
                                .copyWith(
                              fontWeight: FontWeight.bold,
                            ),),
                            Text("Correct : 2/45", style: Theme
                                .of(context)
                                .textTheme
                                .body1
                                .copyWith(
                              fontWeight: FontWeight.bold,
                            ),),
                            Text("Percentage : 4.44 ", style: Theme
                                .of(context)
                                .textTheme
                                .body1
                                .copyWith(
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),
                      ),
                    ],

                  ),
                ),
                // RCard(
                //     elevation: 0.5,
                //     shadowColor: Theme
                //         .of(context)
                //         .accentColor,
                //     child: Column(
                //       children: [
                //         ExpansionTile(
                //           // backgroundColor: Colors.blue,
                //           title: Text(
                //             "Physics",
                //             style: TextStyle(
                //                 fontSize: 18.0,
                //                 fontWeight: FontWeight.bold
                //             ),
                //           ),
                //           children: <Widget>[
                //             Padding(
                //               padding: const EdgeInsets.only(left: 20),
                //               child: ListView(
                //                 padding: EdgeInsets.zero,
                //                 shrinkWrap: true,
                //                 physics: NeverScrollableScrollPhysics(),
                //                 children: [
                //                   Text('Total Question: 45 ', style: Theme
                //                       .of(context)
                //                       .textTheme
                //                       .bodyText1
                //                       .copyWith(),),
                //                   Text('Correct: 35/45', style: Theme
                //                       .of(context)
                //                       .textTheme
                //                       .bodyText1
                //                       .copyWith(),),
                //                   Text('Percentage: 77.77', style: Theme
                //                       .of(context)
                //                       .textTheme
                //                       .bodyText1
                //                       .copyWith(),),
                //                 ],
                //               ),
                //             ),
                //             ExpansionTile(
                //               title: Text(
                //                 'Chemistry',
                //               ),
                //               children: <Widget>[
                //                 Padding(
                //                   padding: const EdgeInsets.only(left: 20),
                //                   child: ListView(
                //                     padding: EdgeInsets.zero,
                //                     shrinkWrap: true,
                //                     physics: NeverScrollableScrollPhysics(),
                //                     children: [
                //                       Text('Total Question: 45 ', style: Theme
                //                           .of(context)
                //                           .textTheme
                //                           .bodyText1
                //                           .copyWith(),),
                //                       Text('Correct: 35/45', style: Theme
                //                           .of(context)
                //                           .textTheme
                //                           .bodyText1
                //                           .copyWith(),),
                //                       Text('Percentage: 77.77', style: Theme
                //                           .of(context)
                //                           .textTheme
                //                           .bodyText1
                //                           .copyWith(),),
                //                     ],
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ],
                //     )),

                RCard(
                  elevation: 0.5,
                  shadowColor: Theme
                      .of(context)
                      .accentColor,
                  child: Column(
                    children: <Widget>[
                      ExpandablePanel(
                        theme: ExpandableThemeData(
                          headerAlignment: ExpandablePanelHeaderAlignment
                              .center,
                          tapBodyToExpand: true,
                          tapBodyToCollapse: true,
                          hasIcon: false,
                          useInkWell: true,
                          animationDuration: Duration(milliseconds: 500),
                        ),
                        header: Container(
                          // color: expanded ? Theme.of(context).dividerColor : null,
                          color: Theme
                              .of(context)
                              .accentColor,

                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Question ",
                                  textScaleFactor: 0.9,
                                  style: Theme.of(context).textTheme.headline6.copyWith(color: Theme.of(context).primaryColor),
                                ),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Theme
                                      .of(context)
                                      .canvasColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Physics",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(color: Theme
                                      .of(context)
                                      .canvasColor),
                                ),
                              ),
                              ExpandIcon(
                                disabledColor: Theme
                                    .of(context)
                                    .canvasColor,
                                onPressed: null,
                                isExpanded: false,
                              ),
                            ],
                          ),
                        ),
                        expanded: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total Question: 45 ', style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(),),
                              Text('Correct: 35/45', style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(),),
                              Text('Percentage: 77.77', style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RCard(
                  elevation: 0.5,
                  shadowColor: Theme
                      .of(context)
                      .accentColor,
                  child: Column(
                    children: <Widget>[
                      ExpandablePanel(
                        theme: ExpandableThemeData(
                          headerAlignment: ExpandablePanelHeaderAlignment
                              .center,
                          tapBodyToExpand: true,
                          tapBodyToCollapse: true,
                          hasIcon: false,
                          useInkWell: true,
                          animationDuration: Duration(milliseconds: 500),
                        ),
                        header: Container(
                          // color: expanded ? Theme.of(context).dividerColor : null,
                          color: Theme
                              .of(context)
                              .accentColor,

                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Question ",
                                  textScaleFactor: 0.9,
                                  style: TextStyle(color: Theme
                                      .of(context)
                                      .accentColor),
                                ),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Theme
                                      .of(context)
                                      .canvasColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Chemistry",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(color: Theme
                                      .of(context)
                                      .canvasColor),
                                ),
                              ),
                              ExpandIcon(
                                disabledColor: Theme
                                    .of(context)
                                    .canvasColor,
                                onPressed: null,
                                isExpanded: false,
                              ),
                            ],
                          ),
                        ),
                        expanded: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total Question: 45 ', style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(),),
                              Text('Correct: 35/45', style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(),),
                              Text('Percentage: 77.77', style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Container(
                //         width: double.infinity,
                //         child: Container(
                //             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
                //             decoration: BoxDecoration(
                //               color: Theme.of(context).accentColor,
                //               borderRadius: BorderRadius.circular(10),
                //             ),
                //             child: Text('Time Spend Per Question ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
                //                 color: Theme.of(context).primaryColor
                //             ),)),
                //       ),
                //     ],
                //
                //   ),
                // ),


              ],
            ),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  // expandedHeight: 240,
                  pinned: true,
                  elevation: 1,
                  leading: IconButton(
                    icon: Icon(FluentSystemIcons.ic_fluent_dismiss_regular),
                    onPressed: () {
                      AppConfig.goto(context, HomePage(), replace: true);
                    },
                  ),
                  title: Text('Chapter Test Reports'),
                  // flexibleSpace: FlexibleSpaceBar(
                  //   background: Container(
                  //     color: Theme.of(context).backgroundColor,
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.end,
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.all(10.0),
                  //           child: SizedBox(
                  //             height: 32,
                  //             child: ClipRRect(
                  //               borderRadius:
                  //                   BorderRadius.circular(AppConfig.kRadiusSmall),
                  //               child: Row(
                  //                 children: [
                  //                   Expanded(
                  //                     flex: _rightCount,
                  //                     child: Container(color: Colors.green),
                  //                   ),
                  //                   Expanded(
                  //                     flex: _wrongCount,
                  //                     child: Container(color: Colors.red),
                  //                   ),
                  //                   Expanded(
                  //                     flex: _unAttendedCount,
                  //                     child: Container(color: Colors.grey),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 10),
                  //           child: Wrap(
                  //             children: [
                  //               LegendTile(
                  //                 "Correct",
                  //                 Colors.green,
                  //               ),
                  //               LegendTile(
                  //                 "Wrong",
                  //                 Colors.red,
                  //               ),
                  //               LegendTile(
                  //                 "Un-attempted",
                  //                 Colors.grey,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                )
              ];
            },
          ),
        ),
        onWillPop: () async {
          showCloseExamDialog();
          return true;
        });
  }

  void showCloseExamDialog() {
    showDialog(
        context: context,
        builder: (_) =>
            AlertDialog(
              title: Text('Reviewed'),
              content: Text('Want to go to homepage?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('No')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/home',
                            (Route<dynamic> route) => false,
                      );
                      // Navigator.pop(context);
                    },
                    child: Text('Yes'))
              ],
            ));
  }
}

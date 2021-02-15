import 'package:expandable/expandable.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/homepage.dart';
import 'package:pearson_flutter/screens/exercise/answer_review.dart';
import 'package:pearson_flutter/screens/exercise/sampleQuestionModel.dart';
import 'package:pearson_flutter/screens/report/non_proctored_report.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class NonProctoredTestReport extends StatefulWidget {
  final List<QuestionModel> questions;

  const NonProctoredTestReport({Key key, this.questions}) : super(key: key);

  @override
  _NonProctoredTestReportState createState() => _NonProctoredTestReportState();
}

class _NonProctoredTestReportState extends State<NonProctoredTestReport> {
  int _currentIndex;

  _callback(int index) {
    setState(() => _currentIndex = index);
  }

  int get _rightCount =>
      widget.questions.where((element) => element.answeredCorrect).length;

  int get _wrongCount =>
      widget.questions.where((element) => element.answeredWrong).length;

  int get _unAttendedCount => widget.questions
      .where((element) => element.selectedAnswer == null)
      .length;




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
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: FlatButton(
                    onPressed: () {
                      AppConfig.popGoto(
                        context,
                        NonProctoredReport(questions: widget.questions),
                      );
                    },
                    child: Text('View Report', style: Theme.of(context).textTheme.headline5,),
                  ),
                ),
                Center(
                  child: Text('Section Wise Result Summary', style: Theme.of(context).textTheme.headline5,),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Material(
                      child: DataTable(
                        // headingRowHeight: 40,
                        // dataRowHeight: 100,
                        // showCheckboxColumn: false,
                        // dividerThickness: 0.3,
                        columns: [
                          DataColumn(label: Text('S.No', style: Theme
                              .of(context)
                              .textTheme
                              .headline6,)),
                          DataColumn(label: Text('Section Name', style: Theme
                              .of(context)
                              .textTheme
                              .headline6,)),
                          DataColumn(label: Text('Total Questions', style: Theme
                              .of(context)
                              .textTheme
                              .headline6,)),
                          DataColumn(label: Text(
                            'Attempted', style: Theme
                              .of(context)
                              .textTheme
                              .headline6,)),
                          DataColumn(
                              label: Text('Partial Correct', style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6,)),
                          DataColumn(
                              label: Text('Correct', style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6,)),
                          DataColumn(
                              label: Text('Incorrect', style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6,)),
                          DataColumn(
                              label: Text('Unattempted', style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6,)),
                          DataColumn(
                              label: Text('Max Marks', style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6,)),
                          DataColumn(
                              label: Text('Marks Obtained', style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6,)),

                          DataColumn(
                              label: Text('Percentage', style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6,)),


                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text('1')),
                            DataCell(Text('Maths')),
                            DataCell(Text('18')),
                            DataCell(Text('0')),
                            DataCell(Text('0')),
                            DataCell(Text('0')),
                            DataCell(Text('0')),
                            DataCell(Text('18')),
                            DataCell(Text('62')),
                            DataCell(Text('0')),
                            DataCell(Text('0')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('2')),
                            DataCell(Text('Chemistry')),
                            DataCell(Text('18')),
                            DataCell(Text('0')),
                            DataCell(Text('0')),
                            DataCell(Text('0')),
                            DataCell(Text('0')),
                            DataCell(Text('18')),
                            DataCell(Text('62')),
                            DataCell(Text('0')),
                            DataCell(Text('0')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('3')),
                            DataCell(Text('Physics')),
                            DataCell(Text('18')),
                            DataCell(Text('0')),
                            DataCell(Text('0')),
                            DataCell(Text('0')),
                            DataCell(Text('0')),
                            DataCell(Text('18')),
                            DataCell(Text('62')),
                            DataCell(Text('0')),
                            DataCell(Text('0')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('')),
                            DataCell(Text('Over All')),
                            DataCell(Text('18')),
                            DataCell(Text('0')),
                            DataCell(Text('0')),
                            DataCell(Text('0')),
                            DataCell(Text('0')),
                            DataCell(Text('18')),
                            DataCell(Text('62')),
                            DataCell(Text('0')),
                            DataCell(Text('0')),
                          ]),

                        ],
                      ),
                    ),
                  ),
                ),


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
                  title: Text('Non Proctored Test Report'),
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
        builder: (_) => AlertDialog(
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

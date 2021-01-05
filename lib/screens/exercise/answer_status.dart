import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/homepage.dart';
import 'package:pearson_flutter/screens/exercise/answer_review.dart';
import 'package:pearson_flutter/screens/exercise/sampleQuestionModel.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/widgets.dart';

class AnswerStatus extends StatefulWidget {
  final List<QuestionModel> questions;

  const AnswerStatus({Key key, this.questions}) : super(key: key);

  @override
  _AnswerStatusState createState() => _AnswerStatusState();
}

class _AnswerStatusState extends State<AnswerStatus> {
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
            body: ListView.builder(
              itemCount: widget.questions?.length ?? 0,
              padding: EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (context, index) {
                return AnswerReview(
                  widget.questions[index],
                  index: index,
                  expanded: index == _currentIndex,
                  callback: _callback,
                );
              },
            ),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 240,
                  pinned: true,
                  elevation: 1,
                  leading: IconButton(
                    icon: Icon(FluentSystemIcons.ic_fluent_dismiss_regular),
                    onPressed: () {
                      AppConfig.goto(context, HomePage(), replace: true);
                    },
                  ),
                  title: Text('Exam Reports'),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: Theme.of(context).backgroundColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              height: 32,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(AppConfig.kRadiusSmall),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: _rightCount,
                                      child: Container(color: Colors.green),
                                    ),
                                    Expanded(
                                      flex: _wrongCount,
                                      child: Container(color: Colors.red),
                                    ),
                                    Expanded(
                                      flex: _unAttendedCount,
                                      child: Container(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Wrap(
                              children: [
                                LegendTile(
                                  "Correct",
                                  Colors.green,
                                ),
                                LegendTile(
                                  "Wrong",
                                  Colors.red,
                                ),
                                LegendTile(
                                  "Un-attempted",
                                  Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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

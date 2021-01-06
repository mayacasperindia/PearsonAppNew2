import 'package:expandable/expandable.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/screens/exercise/sampleQuestionModel.dart';
import 'package:pearson_flutter/screens/exercise/test_quiz.dart';
import 'package:pearson_flutter/widgets/widgets.dart';

class AnswerReview extends StatelessWidget {
  final int index;
  final bool expanded;
  final QuestionModel question;
  final Function(int index) callback;

  AnswerReview(this.question,
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
        Column(
          children: question.answers
              .map((e) => Column(
                    children: [
                      AnswerRadio(
                        e?.answer,
                        selected: e.selected,
                        correctAnswer: e.isCorrectAnswer,
                        completed: question.done,
                      ),
                      Divider(height: 1),
                    ],
                  ))
              .toList(),
        ),
        Container(
          color: color.withOpacity(0.2),
          padding: EdgeInsets.symmetric(vertical: 5),
          child: LabelValueHolder(
            "Result",
            question.selectedAnswer == null
                ? "Un-attempted"
                : question.answeredCorrect
                    ? "Correct"
                    : "Wrong",
            icon: question.selectedAnswer == null
                ? FluentSystemIcons.ic_fluent_warning_filled
                : question.answeredCorrect
                    ? FluentSystemIcons.ic_fluent_checkmark_circle_filled
                    : FluentSystemIcons.ic_fluent_dismiss_circle_filled,
          ),
        )
      ],
    );
  }

  ExpandableController _controller;

  @override
  Widget build(BuildContext context) {
    var color = question.selectedAnswer == null
        ? Colors.grey
        : question.answeredCorrect
            ? Colors.green
            : Colors.red;
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
                  color: color,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        question.selectedAnswer == null
                            ? FluentSystemIcons.ic_fluent_warning_filled
                            : question.answeredCorrect
                                ? FluentSystemIcons
                                    .ic_fluent_checkmark_circle_filled
                                : FluentSystemIcons
                                    .ic_fluent_dismiss_circle_filled,
                        color: text,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          question.question,
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

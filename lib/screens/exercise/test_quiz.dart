import 'dart:async';
import 'dart:ffi';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:pearson_flutter/screens/exercise/answer_status.dart';
import 'package:pearson_flutter/screens/exercise/information.dart';
import 'package:pearson_flutter/screens/exercise/instruction_bottom_sheet.dart';
import 'package:pearson_flutter/screens/exercise/sampleQuestionModel.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/widgets.dart';
import 'package:sticky_headers/sticky_headers.dart';

class QuestionScreen extends StatefulWidget {
  final bool exercise;
  final bool preMeter;
  final bool practice;
  final bool chapter;
  final bool previousYear;
  final bool proctoredTest;
  final bool nonProctoredTest;
  final bool unit;

  const QuestionScreen({
    Key key,
    this.unit = false,
    this.exercise = false,
    this.preMeter = false,
    this.practice = false,
    this.chapter = false,
    this.previousYear = false,
    this.proctoredTest = false,
    this.nonProctoredTest = false,
  }) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  BottomSheetWidget instructionModal = new BottomSheetWidget();
  var _questions = <QuestionModel>[];
  int _index = 0;
  int _rem = 6000;
  Timer _timer;
  PageController _controller = PageController();

  _init() {
    for (int i = 0; i < 3; i++)
      _questions.add(
        QuestionModel(
          "${i + 1}: General physics and motion in a straight line?",
          [
            Answer("Scalars & vectors"),
            Answer("Motion in a Physics"),
            Answer("Units & measurements"),
            Answer(
              "Projectile motion",
              isCorrectAnswer: true,
              definition: "This is the definition of the answer.",
            ),
          ],
        ),
      );
  }

  @override
  void initState() {
    super.initState();
    _init();
    _startTimer();
  }

  _startTimer() {
    _rem = 6000;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_rem <= 1) {
        timer.cancel();
      }
      setState(() {
        _rem -= 1;
        if (_rem <= 0) {
          _viewReport();
        }
      });
    });
  }

  _viewReport() {
    AppConfig.popGoto(
      context,
      AnswerStatus(questions: _questions),
    );
  }

  @override
  dispose() {
    _timer.cancel();
    super.dispose();
  }

  void nextQuestion() {
    if (_index < _questions.length - 1) {
      _gotoQuestion(_index + 1);
    } else {
      if (_showAnswer || widget.preMeter ) {
        showExerciseEnd();
      } else {
        showCloseExamDialog();
      }
    }
  }

  void prevQuestion() {
    if (_index > 0) {
      _gotoQuestion(_index - 1);
    }
  }

  _gotoQuestion(int index) {
    setState(() {
      _index = index;
    });
    _controller.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(_formatTime),
            bottom: _showPages
                ? PreferredSize(
                    child: _bubble(),
                    preferredSize: Size.fromHeight(40),
                  )
                : null,
            actions: [
              IconButton(
                onPressed: () {
                  showInstructionDialog();
                },
                icon: Icon(FluentSystemIcons.ic_fluent_info_regular),
              ),
            ],
            elevation: 1,
          ),
          body: _body(),
          bottomNavigationBar:
              (widget.exercise || widget.preMeter) ? null : _buildOption(),
        ),
        onWillPop: () async {
          showCloseExamDialog();
          return true;
        });
  }

  _bubble() {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        itemCount: _questions.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () {
              _gotoQuestion(index);
            },
            child: Container(
              width: 36,
              height: 36,
              margin: EdgeInsets.only(right: 5),
              decoration: _index == index
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).accentColor,
                      ),
                    )
                  : null,
              child: Container(
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(10),
                width: 32,
                height: 32,
                decoration: _getDecoration(index),
                alignment: Alignment.center,
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    color: _getColor(index),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _getColor(index) {
    if (_questions[index].marked || _questions[index].flagged)
      return Colors.white;
    return Theme.of(context).accentColor;
  }

  _getDecoration(index) {
    if (_questions[index].flagged)
      return BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.orange,
        border: Border.all(color: Colors.orange),
      );
    if (_questions[index].marked)
      return BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.indigo,
        border: Border.all(color: Colors.indigo),
      );
    return BoxDecoration(
      shape: BoxShape.circle,
      color: Theme.of(context).accentColor.withOpacity(0.2),
      border: Border.all(color: Theme.of(context).accentColor),
    );
  }

  get _formatTime {
    var min = _rem ~/ 60;
    var sec = _rem % 60;
    if (min > 0) {
      return "${min}m ${sec}s rem";
    }
    return "${sec}s rem";
  }

  bool get _showAnswer => widget.exercise && _questions[_index].done;

  _body() {
    return PageView.builder(
        controller: _controller,
        itemCount: _questions.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, int index) {
          return Column(
            children: [
              Container(
                color: Theme.of(context).backgroundColor,
                width: double.maxFinite,
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  _questions[index].question,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: _questions[index]
                            .answers
                            .map((e) => Column(
                                  children: [
                                    AnswerRadio(
                                      e?.answer,
                                      onSelect: () {
                                        setState(() {
                                          _questions[index].selectAnswer(e);
                                        });
                                        if (_autoNext) nextQuestion();
                                      },
                                      selected: e.selected,
                                      correctAnswer: e.isCorrectAnswer,
                                      completed: _questions[index].done,
                                    ),
                                    Divider(height: 1),
                                  ],
                                ))
                            .toList(),
                      ),
                      _showAnswer
                          ? Container(
                              decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(
                                      AppConfig.kRadiusSmall)),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  LabelValueHolder(
                                    "Correct Answer",
                                    _questions[index].correctAnswer?.answer,
                                    icon: FluentSystemIcons
                                        .ic_fluent_checkmark_circle_regular,
                                  ),
                                  LabelValueHolder(
                                    "Definition",
                                    _questions[index].correctAnswer?.definition,
                                    icon: FluentSystemIcons
                                        .ic_fluent_text_description_regular,
                                  ),
                                ],
                              ),
                            )
                          : SizedBox.shrink(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 10),
                  Expanded(
                    child: OutlineButton(
                      child: Text(
                        "Clear".toUpperCase(),
                      ),
                      onPressed: _questions[index].selectedAnswer == null
                          ? null
                          : _questions[index].done
                              ? null
                              : () {
                                  setState(() {
                                    _questions[index].clearAnswer();
                                  });
                                },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _nextButton,
                  ),
                  SizedBox(width: 10),
                ],
              )
            ],
          );
        });
  }

  Widget get _nextButton {
    if (_questions[_index].done) {
      if (_index >= _questions.length - 1) {
        return FlatButton(
          color: Colors.red,
          textColor: Colors.white,
          child: Text("End Test".toUpperCase()),
          onPressed: nextQuestion,
        );
      }
      return FlatButton(
        color: Colors.green,
        textColor: Colors.white,
        child: Text(
          "Next".toUpperCase(),
        ),
        onPressed: () => nextQuestion(),
      );
    }
    if (_showAnswer) {
      return FlatButton(
        color: Colors.green,
        textColor: Colors.white,
        child: Text(
          "View Answer".toUpperCase(),
        ),
        onPressed: _questions[_index].selectedAnswer == null &&
                !(_questions[_index].done)
            ? null
            : () {
                setState(() => _questions[_index].done = true);
              },
      );
    }
    return FlatButton(
      color: Colors.green,
      textColor: Colors.white,
      child: Text(
        "Next".toUpperCase(),
      ),
      onPressed: _questions[_index].selectedAnswer == null &&
              !(_questions[_index].done)
          ? null
          : () {
              if (!(widget.chapter || widget.unit)) {
                setState(() {
                  _questions[_index].done = true;
                });
              }
              nextQuestion();
            },
    );
  }

  bool get _showPages =>
      widget.chapter || widget.unit || widget.nonProctoredTest;

  void showExerciseEnd() {
    AppConfig.presentDialog(
      context,
      icon: FluentSystemIcons.ic_fluent_help_circle_filled,
      title: "End Test?",
      message: "Are you sure? You want to submit test?",
      positiveButtonText: "Yes".toUpperCase(),
      negativeButtonText: "Cancel".toUpperCase(),
      positiveTint: Colors.red,
      headerColor: Colors.red,
    ).then((value) {
      if (value ?? false) {
        showSuccessDialog();
      }
    });
  }

  void showCloseExamDialog() {
    AppConfig.presentDialog(
      context,
      icon: FluentSystemIcons.ic_fluent_help_circle_filled,
      title: "End Test?",
      message:
          "You attempted ${_index + 1} of ${_questions.length} questions.\nDo you really want to end the test?",
      positiveButtonText: "Yes".toUpperCase(),
      negativeButtonText: "No".toUpperCase(),
      positiveTint: Colors.red,
      headerColor: Colors.red,
    ).then((value) {
      if (value ?? false) {
        showFlagDialog();
      }
    });
  }

  void showFlagDialog() {
    AppConfig.presentDialog(
      context,
      icon: FluentSystemIcons.ic_fluent_help_circle_filled,
      title: "End Test?",
      message: "There are 2 flagged questions.\nDo you really want to submit?",
      positiveButtonText: "Yes".toUpperCase(),
      negativeButtonText: "No".toUpperCase(),
      positiveTint: Colors.orange,
      headerColor: Colors.orange,
    ).then((value) {
      if (value ?? false) {
        showSuccessDialog();
      }
    });
  }

  void showSuccessDialog() {
    AppConfig.presentMessage(context,
            iconColor: Colors.green,
            message: "Test submitted successfully!",
            buttonText: "View Report".toUpperCase())
        .then((value) {
      if (value ?? false) {
        _viewReport();
      }
    });
  }

  void showInstructionDialog() {
    AppConfig.presentDialogWithChild(
      context,
      ExerciseInfo(),
      margin: EdgeInsets.all(20),
    );
    return;
  }

  bool _autoNext = false;

  _buildOption() {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwitchListTile(
            value: _autoNext,
            onChanged: (v) {
              setState(() => _autoNext = v);
            },
            title: Text(
              "Auto Next",
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 0.8,
            ),
            subtitle: Text(
              "Automatically go to next question",
              textScaleFactor: 0.8,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: FlatButton(
                    onPressed: _questions[_index].selectedAnswer == null
                        ? null
                        : () {
                            setState(() {
                              _questions[_index].flagged = true;
                              _questions[_index].marked = false;
                            });
                            if (_autoNext) nextQuestion();
                          },
                    child: Text('Flag'.toUpperCase()),
                    color: Colors.orange,
                    textColor: Colors.white,
                    disabledColor: Theme.of(context).disabledColor,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: FlatButton(
                    onPressed: _questions[_index].selectedAnswer == null
                        ? () {
                            setState(() {
                              _questions[_index].flagged = false;
                              _questions[_index].marked = true;
                            });
                            if (_autoNext) nextQuestion();
                          }
                        : null,
                    child: Text('Mark'.toUpperCase()),
                    color: Colors.indigo,
                    textColor: Colors.white,
                    disabledColor: Theme.of(context).disabledColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      showCloseExamDialog();
                    },
                    child: Text('End'.toUpperCase()),
                    color: Colors.red,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: OutlineButton(
                    textColor: Theme.of(context).accentColor,
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                    onPressed: _index == 0
                        ? null
                        : () {
                            prevQuestion();
                          },
                    child: Text('Prev'.toUpperCase()),
                    color: Colors.cyan,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: FlatButton(
                    onPressed: nextQuestion,
                    child: Text('Next'.toUpperCase()),
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class AnswerRadio extends StatelessWidget {
  final String text;
  final bool selected;
  final bool correctAnswer;
  final bool completed;
  final bool showAnswer;
  final VoidCallback onSelect;

  const AnswerRadio(
    this.text, {
    Key key,
    this.showAnswer = false,
    this.selected = false,
    this.correctAnswer = false,
    this.completed = false,
    this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? Theme.of(context).accentColor.withOpacity(0.1) : null,
      child: InkWell(
        onTap: completed ? null : onSelect,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: selected ? Theme.of(context).accentColor : null,
                  ),
                ),
              ),
              SizedBox(width: 7.5),
              _getIcon(context),
            ],
          ),
        ),
      ),
    );
  }

  Icon _getIcon(BuildContext context) {
    if (showAnswer && completed) {
      if (correctAnswer) {
        return Icon(
          FluentSystemIcons.ic_fluent_checkmark_circle_filled,
          color: Colors.green,
        );
      }
      return Icon(
        FluentSystemIcons.ic_fluent_dismiss_circle_filled,
        color: Colors.red,
      );
    }
    if (selected) {
      return Icon(
        FluentSystemIcons.ic_fluent_checkmark_circle_filled,
        color: Theme.of(context).accentColor,
      );
    }
    return Icon(
      FluentSystemIcons.ic_fluent_checkmark_circle_regular,
      color: Theme.of(context).dividerColor,
    );
  }
}

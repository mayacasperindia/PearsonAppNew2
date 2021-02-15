import 'dart:math';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/screens/exercise/sampleQuestionModel.dart';
import 'package:pearson_flutter/screens/exercise/test_quiz.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/widgets.dart';

class QuestionsPreview extends StatefulWidget {
  final int page;

  QuestionsPreview({this.page = 0});

  @override
  _QuestionsPreviewState createState() => _QuestionsPreviewState();
}

class _QuestionsPreviewState extends State<QuestionsPreview> {
  var _questions = <QuestionModel>[];
  PageController _controller;

  _init() {
    for (int i = 0; i < 12; i++)
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
    _init();
    _index = widget.page;
    _controller = PageController(initialPage: widget.page);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: FractionallySizedBox(
          heightFactor: 0.88,
          child: Material(
            borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
            clipBehavior: Clip.hardEdge,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Preview Question",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    IconButton(
                      icon: Icon(FluentSystemIcons.ic_fluent_dismiss_regular),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
                Flexible(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: _questions.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, int index) {
                      var rand = Random().nextInt(3);
                      return Column(
                        mainAxisSize: MainAxisSize.min,
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
                                mainAxisSize: MainAxisSize.min,
                                children: _questions[index].answers.map((e) {
                                  var selected =
                                      _questions[index].answers.indexOf(e) ==
                                          rand;
                                  return Column(
                                    children: [
                                      AnswerRadio(
                                        e?.answer,
                                        onSelect: () {},
                                        selected: selected,
                                        correctAnswer: e.isCorrectAnswer,
                                        completed: true,
                                        showAnswer: true,
                                      ),
                                      Divider(height: 1),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(
                                    AppConfig.kRadiusSmall)),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            margin: EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                LabelValueHolder(
                                  "Correct Answer",
                                  _questions[index].correctAnswer?.answer,
                                  icon: FluentSystemIcons
                                      .ic_fluent_checkmark_circle_regular,
                                ),
                                LabelValueHolder(
                                  "Solution",
                                  _questions[index].correctAnswer?.definition,
                                  icon: FluentSystemIcons
                                      .ic_fluent_text_description_regular,
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                _bubble(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int _index = 0;

  List<bool> get _selected => List.generate(
      _questions.length, (index) => _index == index ? true : false);

  _bubble() {
    return SizedBox(
      height: 48,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ToggleButtons(
          fillColor: Theme.of(context).accentColor,
          selectedBorderColor: Theme.of(context).accentColor,
          borderColor: Theme.of(context).accentColor.withOpacity(0.2),
          color: Theme.of(context).accentColor,
          selectedColor: Colors.white,
          onPressed: (index) {
            setState(() {
              _index = index;
              _controller.animateToPage(
                _index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInToLinear,
              );
            });
          },
          children:
              List.generate(_questions.length, (index) => Text("${index + 1}")),
          isSelected: _selected,
        ),
      ),
    );
  }
}

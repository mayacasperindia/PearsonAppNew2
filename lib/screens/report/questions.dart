import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pearson_flutter/screens/report/questions_preview.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/widgets.dart';

class Questions extends StatelessWidget {
  var _questions = [
    QuestionAnswer(
      question: "The dimension of the pressure are the same as that of-",
      timeTaken: 7,
      difficultyLevel: "medium",
      cognitiveLevel: "understanding",
      isRight: true,
    ),
    QuestionAnswer(
      question:
          "We have error in the measurement of length, radius and mass of a wire are 2%, 3% and 2% then error in it's density will be-",
      timeTaken: 4,
      difficultyLevel: "medium",
      cognitiveLevel: "understanding",
      isRight: false,
    ),
    QuestionAnswer(
      question:
          "In the Searle’s experiment to find Young’s modulus, the slope of the following graph is_________. (Given: mass is M, Length of the wire is L, cross-sectional radius is r and Young’s modulus is Y).",
      timeTaken: 4,
      image:
          "https://wheebox.com/static/MCQuplaodimage/0311000/08-08-2018/8f993b4def6441c8a3beaf94321f4560.jpeg",
      difficultyLevel: "medium",
      cognitiveLevel: "understanding",
      isRight: false,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return RCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          IconLabel(Icons.help_center, "Question-wise report"),
          Wrap(
            children: [
              IconValue(
                FluentSystemIcons.ic_fluent_timer_regular,
                "Time Spent",
              ),
              IconValue(
                FluentSystemIcons.ic_fluent_launcher_settings_regular,
                "Difficulty Level",
              ),
              IconValue(
                FluentSystemIcons.ic_fluent_dark_theme_regular,
                "Cognitive Level",
              ),
              IconValue(
                FluentSystemIcons.ic_fluent_checkmark_circle_filled,
                "Correct",
                iconColor: AppConfig.kSuccessColor,
              ),
              IconValue(
                FluentSystemIcons.ic_fluent_dismiss_circle_filled,
                "Incorrect",
                iconColor: AppConfig.kErrorColor,
              ),
            ],
          ),
          Divider(height: 1),
          AspectRatio(
            aspectRatio: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (var item in _questions)
                    QuestionCard(
                      answer: item,
                      sn: _questions.indexOf(item) + 1,
                      onPreviewTap: () =>
                          _onPreview(context, _questions.indexOf(item)),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onPreview(BuildContext context, int page) {
    AppConfig.presentDialogWithChild(context, QuestionsPreview(page: page));
  }
}

class QuestionCard extends StatelessWidget {
  final QuestionAnswer answer;
  final int sn;
  final VoidCallback onPreviewTap;

  const QuestionCard({Key key, this.answer, this.sn, this.onPreviewTap})
      : super(key: key);

  String padZero(n) => n < 10 ? "0$n" : "$n";

  String get _time {
    var sec = answer.timeTaken;
    return "${padZero(sec ~/ 60)}:${padZero(sec % 60)}";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(answer.question),
              ),
              answer.image == null
                  ? SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: CachedNetworkImage(
                        imageUrl: answer.image,
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  children: [
                    IconValue(FluentSystemIcons.ic_fluent_timer_regular, _time),
                    IconValue(
                      FluentSystemIcons.ic_fluent_launcher_settings_regular,
                      answer.difficultyLevel.toUpperCase(),
                    ),
                    IconValue(
                      FluentSystemIcons.ic_fluent_dark_theme_regular,
                      answer.cognitiveLevel.toUpperCase(),
                    ),
                  ],
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  answer.isRight
                      ? Icon(
                          FluentSystemIcons.ic_fluent_checkmark_circle_filled,
                          color: AppConfig.kSuccessColor,
                        )
                      : Icon(
                          FluentSystemIcons.ic_fluent_dismiss_circle_filled,
                          color: AppConfig.kErrorColor,
                        ),
                  Flexible(
                    child: SizedBox(
                      height: 28,
                      child: FlatButton(
                        onPressed: onPreviewTap,
                        color: Theme.of(context).buttonColor,
                        child: Text(
                          "Preview".toUpperCase(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          child: Text(
            "$sn",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(AppConfig.kRadiusSmallest),
            ),
          ),
        ),
      ],
    );
  }
}

class QuestionAnswer {
  final String question;
  final String image;
  final int timeTaken;
  final String difficultyLevel;
  final String cognitiveLevel;
  final bool isRight;

  QuestionAnswer(
      {this.question,
      this.image,
      this.timeTaken,
      this.difficultyLevel,
      this.cognitiveLevel,
      this.isRight});
}

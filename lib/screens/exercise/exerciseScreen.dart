import 'dart:async';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pearson_flutter/homepage.dart';
import 'package:pearson_flutter/screens/exercise/test_quiz.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/widgets.dart';
import 'package:sticky_headers/sticky_headers.dart';

class ExerciseScreen extends StatefulWidget {
  final bool exercise;
  final bool preMeter;
  final bool practice;
  final bool chapter;
  final bool previousYear;
  final bool proctoredTest;
  final bool nonProctoredTest;
  final bool unit;

  const ExerciseScreen(
      {Key key,
        this.unit,
        this.exercise,
        this.preMeter,
        this.practice,
        this.chapter,
        this.previousYear,
        this.proctoredTest,
        this.nonProctoredTest})
      : super(key: key);

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int secondsRemaining = 5;
  Timer _timer;
  bool _agreed = false;

  @override
  initState() {
    super.initState();
    _startTimer();
  }

  _startTimer() {
    secondsRemaining = 5;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (secondsRemaining <= 1) {
        timer.cancel();
      }
      setState(() {
        secondsRemaining -= 1;
      });
    });
  }

  @override
  dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Waiting Lounge"),
      ),
      body: body(),
      bottomNavigationBar: Material(
        elevation: 20,
        color: secondsRemaining > 0
            ? Theme.of(context).backgroundColor
            : Theme.of(context).accentColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                ..._bottomMessage(),
                SizedBox(width: 5),
                FlatButton(
                  onPressed: secondsRemaining > 0
                      ? null
                      : () {
                    if (_agreed) {
                      AppConfig.goto(
                          context,
                          QuestionScreen(
                            preMeter: widget.preMeter ?? false,
                            exercise: widget.exercise ?? false,
                            chapter: widget.chapter ?? false,
                            nonProctoredTest:
                            widget.nonProctoredTest ?? false,
                            practice: widget.practice ?? false,
                            previousYear: widget.previousYear ?? false,
                            proctoredTest: widget.proctoredTest ?? false,
                            unit: widget.unit ?? false,
                          ));
                    } else {
                      AppConfig.presentMessage(
                        context,
                        message:
                        "Please accept the terms and conditions!",
                        icon: FluentSystemIcons.ic_fluent_warning_regular,
                        iconColor: Theme.of(context).errorColor,
                      );
                    }
                  },
                  textColor: Theme.of(context).accentColor,
                  color: Colors.white,
                  disabledColor: Colors.grey,
                  child: Text("Proceed".toUpperCase()),
                ),
                SizedBox(width: 10),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: SizedBox(
                    height: 24,
                    child: FlatButton(
                      minWidth: 14,
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "T&Cs",
                        style: Theme.of(context).textTheme.caption.copyWith(
                          color: secondsRemaining > 0 ? null : Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Dot(),
                Flexible(
                  child: SizedBox(
                    height: 24,
                    child: FlatButton(
                      minWidth: 24,
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Policy",
                        style: Theme.of(context).textTheme.caption.copyWith(
                          color: secondsRemaining > 0 ? null : Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
            ),
            child: Text(
              'You are requested to wait on this page until the scheduled test time. Please read all the test instructions carefully. When the wait time is over, the ‘Proceed Now’ button will be activated and will turn green. You can click on it and move to the test window. ',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          StickyHeader(
            header: SectioTitle('Security Instructions'),
            content: Column(
              children: [
                ULText(
                    'During the test, user should not switch from the test page to any other page.'),
                ULText(
                    'Once logged-in through one browser tab, user cannot login from any other browser/same browser tab.'),
              ],
            ),
          ),
          StickyHeader(
            header: SectioTitle('Navigation Tools'),
            content: Column(
              children: [
                ULText(
                    'Mark: To mark a question for review (To Respond Later), click on mark button.'),
                ULText(
                    'Flag: To flag a question (To respond later), choose an answer and click on flag button.'),
                ULText(
                    'Next: By clicking Next button, the next question appears.'),
                ULText(
                    'Previous: By clicking Previous button, the previous question appears.'),
                ULText(
                    'End Test: By clicking End Test button, the test gets submitted.'),
              ],
            ),
          ),
          StickyHeader(
            header: SectioTitle('Legend'),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Wrap(
                children: [
                  LegendTile(
                    "Attempted",
                    Colors.green,
                  ),
                  LegendTile(
                    "Flag",
                    Colors.orange,
                  ),
                  LegendTile(
                    "Mark",
                    Colors.indigo,
                  ),
                  LegendTile(
                    "Un-attempted",
                    Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          StickyHeader(
            header: SectioTitle('Test Information'),
            content: Column(
              children: [
                ULText(
                  'Test Name: General Physics and Motion in a Straight Line - 2 ',
                  bullet: Icon(FluentSystemIcons.ic_fluent_notebook_regular),
                ),
                ULText(
                  'Allocated Time: 60min',
                  bullet: Icon(FluentSystemIcons.ic_fluent_timer_regular),
                ),
                ULText(
                  'No. Of Questions: 45 ',
                  bullet: Icon(
                    FluentSystemIcons.ic_fluent_notebook_question_mark_regular,
                  ),
                ),
                ULText(
                  'Correct Answer Carries: 4 marks',
                  bullet: Icon(
                      FluentSystemIcons.ic_fluent_checkmark_circle_regular),
                ),
                ULText(
                  'Wrong Answer Deducts: 1 mark',
                  bullet:
                  Icon(FluentSystemIcons.ic_fluent_dismiss_circle_regular),
                ),
              ],
            ),
          ),
          StickyHeader(
            header: SectioTitle('Standard Instructions'),
            content: Column(
              children: [
                ULText('Chapter Tests are autogenerated'),
                ULText(
                    'The clock of 60 mins will be set at the server. The countdown timer in the top center of the screen will display the remaining time available for you to complete the test. When the timer reaches zero, the test will end by itself. You will not be required to end or submit your examination.'),
                ULText(
                    'The Test consists of 45 questions. The maximum marks are 180.'),
                ULText(
                    'Each question is allotted 4 (four) marks for correct response and 1(one) mark will be deducted for indicating incorrect response of each question. No deduction from the total score will be made if no response is indicated for an item.'),
                ULText(
                    'You can click on the arrow icon, appears to the top left of the screen, to collapse the question palette thereby maximizing the question window. To view the question palette again, click on the icon again.'),
                ULText(
                    'Procedure for answering a multiple-choice type question: a. To select you answer, click on the button of one of the options. b. To change your chosen answer, click on the button of another option c. To save your answer, you MUST click on the Next button. d. To mark the question for review, click on the Mark for Review button.'),
                ULText(
                    'To change your answer to a question that has already been answered, first select that question from question pallet for answering and then follow the procedure for answering that type of question.'),
                ULText(
                    'You can shuffle between sections and questions anything during the examination as per your convenience only during the time stipulated.'),
                ULText(
                    'Please contact your Test Administrator in case of a power failure as the test may be recovered. If test recovery is not possible then test will have to be rescheduled.'),
                ULText(
                    'In case of complete Internet failure, submission will not be possible & the test will have to be rescheduled. In case of temporary internet outage please wait for some time and try to resubmit the test. '),
                ULText(
                    'If the internet speed is unreasonably slow, images and tables in the question may take a little longer to appear.'),
                ULText(
                    'This is a Multiple-Choice Question (MCQ) type Test. You can go back to the previous questions.'),
              ],
            ),
          ),
          Material(
            color: Theme.of(context).backgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CheckboxListTile(
                value: _agreed,
                controlAffinity: ListTileControlAffinity.leading,
                subtitle: Text(
                  'I have gone through the general instructions, security instructions, terms and conditions and privacy policy for taking the test and understand that Pearson will not be liable for any damages of any kind arising from the use of this site, including but not limited to direct, indirect, incidental, punitive consequential damages.',
                  textAlign: TextAlign.justify,
                ),
                onChanged: (v) {
                  setState(() {
                    _agreed = v;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _bottomMessage() {
    if (secondsRemaining > 0)
      return [
        Icon(
          FluentSystemIcons.ic_fluent_timer_regular,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Wait time...',
              ),
              Text(
                '${secondsRemaining}s',
                textScaleFactor: 1.3,
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ];
    return [
      Icon(
        FluentSystemIcons.ic_fluent_checkmark_circle_filled,
        color: Colors.white70,
      ),
      SizedBox(width: 10),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'All good!',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            Text(
              "Let's start",
              textScaleFactor: 1.1,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ];
  }
}
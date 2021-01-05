import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/widgets.dart';
import 'package:sticky_headers/sticky_headers.dart';

class ExerciseInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
        child: Column(
          children: [
            SizedBox(
              height: 56,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Information",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            ),
            Divider(height: 1),
            Expanded(
              child: SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelValueHolder(
                        'Domain',
                        'Neet',
                        icon: FluentSystemIcons.ic_fluent_globe_desktop_regular,
                      ),
                      LabelValueHolder(
                        'Test Name',
                        'General Physics and Motion in a Straight Line - 1',
                        icon: FluentSystemIcons.ic_fluent_notebook_regular,
                      ),
                      LabelValueHolder(
                        'No. Of Questions',
                        '45',
                        icon: FluentSystemIcons
                            .ic_fluent_notebook_question_mark_regular,
                      ),
                      LabelValueHolder(
                        'Allocated Time',
                        '60min',
                        icon: FluentSystemIcons.ic_fluent_timer_regular,
                      ),
                      StickyHeader(
                        header: SectioTitle('Navigation Tools'),
                        content: Column(
                          children: [
                            ULText(
                              'To mark a question for review (To Respond Later), click on mark button.',
                              bullet: BulletButton(
                                "Mark",
                                color: Colors.indigo,
                              ),
                            ),
                            ULText(
                              'To flag a question (To respond later), choose an answer and click on flag button.',
                              bullet: BulletButton(
                                "Flag",
                                color: Colors.orange,
                              ),
                            ),
                            ULText(
                              'By clicking Next button, the next question appears.',
                              bullet: BulletButton("Next"),
                            ),
                            ULText(
                              'By clicking Prev button, the previous question appears.',
                              bullet: BulletButton("Prev", bordered: true),
                            ),
                            ULText(
                              "By clicking End button, the test gets submitted.",
                              bullet: BulletButton("End", color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      StickyHeader(
                        header: SectioTitle("Standard Instructions"),
                        content: Column(
                          children: [
                            ULText('Chapter Tests are autogenerated'),
                            ULText(
                                'The clock of 60min will be set at the server. The countdown timer in the top center of the screen will display the remaining time available for you to complete the test. When the timer reaches zero, the test will end by itself. You will not be required to end or submit your examination.'),
                            ULText(
                                'The Test consists of 45 questions. The maximum marks are 180.'),
                            ULText(
                                'Each question is allotted 4 (four) marks for correct response and 1(one) mark will be deducted for indicating incorrect response of each question. No deduction from the total score will be made if no response is indicated for an item.'),
                            ULText(
                                'You can click on the arrow icon, appears to the top left of the screen, to collapse the question palette thereby maximizing the question window. To view the question palette again, click on the icon again. '),
                            ULText(
                                'Procedure for answering a multiple-choice type question: a. To select you answer, click on the button of one of the options. b. To change your chosen answer, click on the button of another option c. To save your answer, you MUST click on the Next button. d. To mark the question for review, click on the Mark for Review button. '),
                            ULText(
                                'To change your answer to a question that has already been answered, first select that question from question pallet for answering and then follow the procedure for answering that type of question. '),
                            ULText(
                                'You can shuffle between sections and questions anything during the examination as per your convenience only during the time stipulated. '),
                            ULText(
                                'Please contact your Test Administrator in case of a power failure as the test may be recovered. If test recovery is not possible then test will have to be rescheduled. '),
                            ULText(
                                'In case of complete Internet failure, submission will not be possible & the test will have to be rescheduled. In case of temporary internet outage please wait for some time and try to resubmit the test. '),
                            ULText(
                                'If the internet speed is unreasonably slow, images and tables in the question may take a little longer to appear. '),
                            ULText(
                                'This is a Multiple-Choice Question (MCQ) type Test. You can go back to the previous questions. '),
                          ],
                        ),
                      ),
                      StickyHeader(
                        header: SectioTitle('Help Center'),
                        content: ULText(
                            'In case there is a power failure or internet connection breaks, the timer will stop at that very instant. The user can resume the test from where it was left.For test recovery or reschedule please contact your local administrator or write an email to myinsights.support@pearson.com mentioning your User Id.'),
                      ),
                      StickyHeader(
                        header: SectioTitle('Security'),
                        content: ULText(
                            'Once logged-in through one browser tab, user cannot login from any other browser/same browser tab.'),
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
                    ],
                  ),
                ),
              ),
            ),
            Divider(height: 1),
            FractionallySizedBox(
              widthFactor: 1,
              child: SizedBox(
                height: 48,
                child: FlatButton(
                  textColor: Theme.of(context).accentColor,
                  onPressed: () => Navigator.pop(context, true),
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  child: Text(
                    "Got It".toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
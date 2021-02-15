import 'package:expandable/expandable.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/homepage.dart';
import 'package:pearson_flutter/screens/exercise/answer_review.dart';
import 'package:pearson_flutter/screens/exercise/sampleQuestionModel.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PreviewQuestionAnswer extends StatefulWidget {
  final List<QuestionModel> questions;

  const PreviewQuestionAnswer({Key key, this.questions}) : super(key: key);

  @override
  _PreviewQuestionAnswerState createState() => _PreviewQuestionAnswerState();
}

class _PreviewQuestionAnswerState extends State<PreviewQuestionAnswer> {

  @override
  Widget build(BuildContext context) {
    print(widget.questions);
    return Scaffold(
      body: NestedScrollView(
        body: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Questions: ',
                      style: Theme.of(context).textTheme.headline5,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('A particle traversed one third the distance with a velocity v0 . The remaining part of the distance was covered with velocity v1  forhalf the time and with a velocity v2 for the remaining half of time. Assuming motion to be rectilinear, the speed of the particle averaged over the entire time of motion is',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 18)
                      ,),
                  ),
                  Divider(height: 2),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text('Options : ',
                      style: Theme.of(context).textTheme.headline5,),
                  ),
                  Container(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: null,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Units and Measurements',
                                    style: TextStyle(
                                      color: null,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 7.5),
                                Icon(
                                  FluentSystemIcons.ic_fluent_checkmark_circle_filled,
                                  color: Colors.green,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(height: 1),
                        InkWell(
                          onTap: null,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Units and Measurements',
                                    style: TextStyle(
                                      color: null,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 7.5),
                                Icon(
                                  FluentSystemIcons.ic_fluent_dismiss_circle_filled,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(height: 1),
                        InkWell(
                          onTap: null,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Units and Measurements',
                                    style: TextStyle(
                                      color: null,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 7.5),
                                Icon(
                                  FluentSystemIcons.ic_fluent_dismiss_circle_filled,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(height: 1),
                        InkWell(
                          onTap: null,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Units and Measurements',
                                    style: TextStyle(
                                      color: null,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 7.5),
                                Icon(
                                  FluentSystemIcons.ic_fluent_dismiss_circle_filled,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(height: 1),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text('Answer : ',
                      style: Theme.of(context).textTheme.headline5,),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Let us first draw a pictorial representation to the problem.'),
                        Image.asset('assets/images/answer.png')
                      ],
                    ),
                  )
                ],
              ),
            )
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
                  Navigator.pop(context);
                },
              ),
              title: Text('Preview Question'),
            )
          ];
        },
      ),
    );
  }
}

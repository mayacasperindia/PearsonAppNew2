import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pearson_flutter/homepage.dart';
import 'package:pearson_flutter/screens/exercise/test_quiz.dart';

class ExerciseScreen extends StatefulWidget {
  final bool exercise;
  final bool preMeter;
  final bool practice;
  final bool chapter;
  final bool previousYear;
  final bool proctoredTest;
  final bool nonProctoredTest;
  final bool unit;

  const ExerciseScreen({Key key, this.unit, this.exercise, this.preMeter, this.practice, this.chapter, this.previousYear, this.proctoredTest, this.nonProctoredTest}) : super(key: key);


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
        backgroundColor: Theme.of(context).accentColor,
        title: Text('Waiting Lounge', style: TextStyle(
          color: Colors.white,
        ),),
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Theme.of(context).accentColor,
          // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: Theme.of(context).accentColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "Hi User, Please wait in our 'Approved Test Taker Waiting Lounge'",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'You are requested to wait on this page until the scheduled test time. Please read all the test instructions carefully. When the wait time is over, the ‘Proceed Now’ button will be activated and will turn green. You can click on it and move to the test window. ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _agreed,
                          onChanged: (v) {
                            setState(() {
                              _agreed = v;
                            });
                          },
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              'I have gone through the general instructions, security instructions, terms and conditions and privacy policy for taking the test and understand that Pearson will not be liable for any damages of any kind arising from the use of this site, including but not limited to direct, indirect, incidental, punitive consequential damages.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                    secondsRemaining == 0 ? Container() :Row(
                      children: [
                        Icon(
                          Icons.lock_clock,
                          size: 25,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Waiting time will be over in $secondsRemaining Second',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    MaterialButton(
                      onPressed: secondsRemaining <= 0 ? () {
                        if (!_agreed) {
                          showDialog(context: context,
                              builder: (_) =>
                                  AlertDialog(
                                    title: Text('Terms and conditions '),
                                    content: Text('Please accept terms and conditions'),
                                    actions: [
                                      TextButton(onPressed: () {
                                        Navigator.pop(context);
                                        // Navigator.pop(context);
                                      }, child: Text('Ok'))
                                    ],
                                  )
                          );
                        }
                        else {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => QuestionScreen(
                                preMeter: widget.preMeter ?? false,
                                exercise: widget.exercise ?? false,
                                chapter: widget.chapter ?? false,
                                nonProctoredTest: widget.nonProctoredTest ?? false,
                                practice: widget.practice ?? false,
                                previousYear: widget.previousYear ?? false,
                                proctoredTest: widget.proctoredTest ?? false,
                                unit: widget.unit ?? false,
                              )
                          ));
                        }
                      } : null,
                      color: Colors.green,
                      disabledColor: Colors.black12,
                      child: Text('Proceed Now', style: TextStyle(
                        color: Colors.white
                      ),),
                    ),
                    Text(
                      'Terms and conditions | Privacy Policy',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                color: Theme.of(context).primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Security Instructions', style: TextStyle(
                      fontWeight: FontWeight.bold, color: Theme.of(context).accentColor
                    ),),
                    StandardInstructions('During the test, user should not switch from the test page to any other page.'),
                    StandardInstructions('Once logged-in through one browser tab, user cannot login from any other browser/same browser tab.'),
                    Text('Navigation Tools', style: TextStyle(
                        fontWeight: FontWeight.bold, color: Theme.of(context).accentColor
                    ),),
                    StandardInstructions('Mark: To mark a question for review (To Respond Later), click on mark button.'),
                    StandardInstructions('Flag: To flag a question (To respond later), choose an answer and click on flag button.'),
                    StandardInstructions('Next: By clicking Next button, the next question appears.'),
                    StandardInstructions('Previous: By clicking Previous button, the previous question appears.'),
                    StandardInstructions('End Test: By clicking End Test button, the test gets submitted.'),
                    Text('Legend', style: TextStyle(
                        fontWeight: FontWeight.bold, color: Theme.of(context).accentColor
                    ),),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(5),
                          color: Colors.greenAccent,
                          child: Text('01', style: TextStyle(fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('Attempted', style: TextStyle(fontSize: 14),),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(5),
                          color: Colors.redAccent,
                          child: Text('02', style: TextStyle(fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('Flag', style: TextStyle(fontSize: 14),),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(5),
                          color: Colors.blueAccent,
                          child: Text('03', style: TextStyle(fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('Mark', style: TextStyle(fontSize: 14),),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(5),
                          color: Colors.grey,
                          child: Text('04', style: TextStyle(fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('Unattempted', style: TextStyle(fontSize: 14),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                color: Theme.of(context).primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text('Test Information', style: TextStyle(
                          fontWeight: FontWeight.bold, color: Theme.of(context).accentColor
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.center_focus_strong),
                          Flexible(
                            child: Text('Test Name: General Physics and Motion in a Straight Line - 2 ',
                              style: TextStyle(
                              fontSize: 14,
                            ),),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.access_time_rounded),
                          Flexible(
                            child: Text('Allocated Time:60 Mins ', style: TextStyle(
                              fontSize: 14,
                            ),),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.book_online_rounded),
                          Flexible(
                            child: Text('No. Of Questions: 45 ', style: TextStyle(
                              fontSize: 14,
                            ),),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.check),
                          Flexible(
                            child: Text('Correct Answer Carries: : 4 Mark ', style: TextStyle(
                              fontSize: 14,
                            ),),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.clear),
                          Flexible(
                            child: Text('Wrong Answer Deducts: : 1 Mark ', style: TextStyle(
                              fontSize: 14,
                            ),),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                color: Theme.of(context).primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Standard Instructions', style: TextStyle(
                        fontWeight: FontWeight.bold, color: Theme.of(context).accentColor
                    ),),
                    StandardInstructions('Chapter Tests are autogenerated'),
                    StandardInstructions('The clock of 60 mins will be set at the server. The countdown timer in the top center of the screen will display the remaining time available for you to complete the test. When the timer reaches zero, the test will end by itself. You will not be required to end or submit your examination.'),
                    StandardInstructions('The Test consists of 45 questions. The maximum marks are 180.'),
                    StandardInstructions('Each question is allotted 4 (four) marks for correct response and 1(one) mark will be deducted for indicating incorrect response of each question. No deduction from the total score will be made if no response is indicated for an item.'),
                    StandardInstructions('You can click on the arrow icon, appears to the top left of the screen, to collapse the question palette thereby maximizing the question window. To view the question palette again, click on the icon again.'),
                    StandardInstructions('Procedure for answering a multiple-choice type question: a. To select you answer, click on the button of one of the options. b. To change your chosen answer, click on the button of another option c. To save your answer, you MUST click on the Next button. d. To mark the question for review, click on the Mark for Review button.'),
                    StandardInstructions('To change your answer to a question that has already been answered, first select that question from question pallet for answering and then follow the procedure for answering that type of question.'),
                    StandardInstructions('You can shuffle between sections and questions anything during the examination as per your convenience only during the time stipulated.'),
                    StandardInstructions('Please contact your Test Administrator in case of a power failure as the test may be recovered. If test recovery is not possible then test will have to be rescheduled.'),
                    StandardInstructions('In case of complete Internet failure, submission will not be possible & the test will have to be rescheduled. In case of temporary internet outage please wait for some time and try to resubmit the test. '),
                    StandardInstructions('If the internet speed is unreasonably slow, images and tables in the question may take a little longer to appear.'),
                    StandardInstructions('This is a Multiple-Choice Question (MCQ) type Test. You can go back to the previous questions.'),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  StandardInstructions(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('» $text', style: TextStyle(fontSize: 14,),),
    );
  }

}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pearson_flutter/homepage.dart';
import 'package:pearson_flutter/screens/exercise/answer_status.dart';
import 'package:pearson_flutter/screens/exercise/attended_answer_screen.dart';
import 'package:pearson_flutter/screens/exercise/instruction_bottom_sheet.dart';
import 'package:pearson_flutter/screens/exercise/sampleQuestion.dart';
import 'package:pearson_flutter/screens/exercise/sampleQuestionModel.dart';

class QuestionScreen extends StatefulWidget {
  final bool exercise;
  final bool preMeter;
  final bool practice;
  final bool chapter;
  final bool previousYear;
  final bool proctoredTest;
  final bool nonProctoredTest;
  final bool unit;

  const QuestionScreen({Key key, this.unit, this.exercise, this.preMeter, this.practice, this.chapter, this.previousYear, this.proctoredTest, this.nonProctoredTest}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  BottomSheetWidget instructionModal = new BottomSheetWidget();
  int currentOptionId;
  bool isCorrect;
  List<QuestionModel> questions = new List<QuestionModel>();
  int index = 0;
  int secondsRemaining = 6000;
  Timer _timer;
  int answer = 3;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    questions = getQuestions();
    _startTimer();
  }

  _startTimer() {
    secondsRemaining = 6000;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (secondsRemaining <= 1) {
        timer.cancel();
      }
      setState(() {
        secondsRemaining -= 1;
        if (secondsRemaining <= 0) {
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => AnswerStatus()
          ));
        }
      });
    });
  }


  @override
  dispose() {
    _timer.cancel();
    super.dispose();
  }

  void nextQuestion() {
    if (index < questions.length - 1) {
      index++;
    } else {
      showCloseExamDialog();

    }
  }

  void prevQuestion() {
    if (index > 0) {
      index--;
    }
  }

  void fixedQuestion(int id) {
      index = id;
  }

  @override
  Widget build(BuildContext context) {
    final isCompleted = isCorrect != null;
    // final _question = Provider.of<QuizNotifier>(context);

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('$secondsRemaining Minutes'),
          centerTitle: true,
          actions: [
            TextButton(onPressed: () {
              showInstructionDialog();
            }, child: Column(
              children: [
                Icon(Icons.book),
                Text('Show Instruction'),
              ],
            )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.92,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (widget.exercise || widget.preMeter) ? Container() :
                  Container(
                    height: 40,
                      child: ListView.builder
                        (
                          itemCount: questions.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return GestureDetector(
                              onTap: () {
                                fixedQuestion(index);
                              },
                              child: Container(
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                    border: Border.all(color: Theme.of(context).accentColor),
                                  color: Theme.of(context).accentColor,
                                ),
                                // color: Colors.green,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text((index + 1).toString(), style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                    ),),
                                  ],
                                ),
                              ),
                            );
                          }
                      )
                  ) ,
                  SizedBox(height: 20,),
                  Text(
                    questions[index].question,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: 15),
                  RadioListTile(
                    title: Row(
                      children: [
                        Text("Scalars and Vectors"),
                        (isCorrect != null) ? ((answer == 1) ? Icon(Icons.check, color: Colors.green,) : Icon(Icons.clear, color: Colors.red,)) : Text('')

                      ],
                    ),
                    groupValue: currentOptionId,
                    value: 1,
                    onChanged: (value) {
                      if (!isCompleted)
                        setState(() {
                          currentOptionId = value;
                        });
                    },
                  ),
                  RadioListTile(
                    title: Row(
                      children: [
                        Text("Motion in a Plane"),
                        (isCorrect != null) ? ((answer == 2) ? Icon(Icons.check, color: Colors.green,) : Icon(Icons.clear, color: Colors.red,)) : Text('')
                      ],
                    ),
                    groupValue: currentOptionId,
                    value: 2,
                    onChanged: (value) {
                      if (!isCompleted)
                        setState(() {
                          currentOptionId = value;
                        });
                    },
                  ),
                  RadioListTile(
                    title: Row(
                      children: [
                        Text("Units and Measurements"),
                        Container(
                          width: 20,
                          child: (isCorrect != null) ? ((answer == 3) ? Icon(Icons.check, color: Colors.green,) : Icon(Icons.clear, color: Colors.red,)) : Text(''),
                        )
                      ],
                    ),
                    groupValue: currentOptionId,
                    value: 3,
                    onChanged: (value) {
                      if (!isCompleted)
                        setState(() {
                          currentOptionId = value;
                        });
                    },
                  ),
                  RadioListTile(
                    title: Row(
                      children: [
                        Text("Projectile Motion"),
                        (isCorrect != null) ? ((answer == 4) ? Icon(Icons.check, color: Colors.green,) : Icon(Icons.clear, color: Colors.red,)) : Text('')
                      ],
                    ),
                    groupValue: currentOptionId,
                    value: 4,
                    onChanged: (value) {
                      if (!isCompleted)
                        setState(() {
                          currentOptionId = value;
                        });
                    },
                  ),

                  // Spacer(),
                  (widget.preMeter || widget.proctoredTest || widget.unit || widget.chapter ) ? Container() :
                  (isCorrect != null) ?
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Answer:", style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),),
                          Text('General Physics and Motion in a Straight Line'),
                          Text('Units and Measurements'),
                          Text('Mathematical Physics'),
                          Text('Motion in One Dimension'),
                          Text('Graphical Representation of Motion in One Dimension'),
                        ],
                      ),
                    ) : Container(),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RaisedButton(
                          child: Text(isCompleted ? 'Continue' : 'Submit', style: TextStyle(
                            color: Colors.white
                          ),),
                          onPressed: () {
                            if (currentOptionId != null)
                              setState(() {
                                isCorrect = currentOptionId == answer;
                              });
                            if(isCompleted) {
                              isCorrect = null;
                              currentOptionId = null;
                              nextQuestion();
                            }
                          },
                        ),
                        RaisedButton(
                          child: Text(isCompleted ? 'Selected' : 'Clear', style: TextStyle(
                            color: Colors.white
                          ),),
                          onPressed: () {
                            isCompleted ? null : setState(() {
                              currentOptionId = null;
                            });

                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  // for (var i = 1; i <= questions.length + 1; i++)
                  //   Row(
                  //     children: [
                  //       Text(i.toString()),
                  //     ],
                  //   ),

                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: (widget.exercise || widget.preMeter) ? null : _buildOption(),
      ), onWillPop: () async {
      showCloseExamDialog();
      return true;
    }
    );
  }

  void showCloseExamDialog() {
    showDialog(context: context,
        builder: (_) =>
            AlertDialog(
              title: Text('Finishing'),
              content: Text('You Attempted 10 out of 45, Are you sure want to end test?'),
              actions: [
                TextButton(onPressed: () {
                  Navigator.of(context).pop();
                }, child: Text('No')),
                TextButton(onPressed: () {
                  Navigator.pop(context);
                  showFlagDialog();
                  // Navigator.pop(context);
                }, child: Text('Yes'))
              ],
            )
    );
  }

  void showFlagDialog() {
    showDialog(context: context,
        builder: (_) =>
            AlertDialog(
              title: Text('Finishing'),
              content: Text('2 Flag questions are there do you want to submit?'),
              actions: [
                TextButton(onPressed: () {
                  Navigator.of(context).pop();
                }, child: Text('No')),
                TextButton(onPressed: () {
                  Navigator.pop(context);
                  showSuccessDialog();
                  // Navigator.pop(context);
                }, child: Text('Yes'))
              ],
            )
    );
  }

  void showSuccessDialog() {
    showDialog(context: context,
        barrierDismissible: false,
        builder: (_) =>
            AlertDialog(
              title: Text('Finished'),
              content: Text('Test Submitted Successfully.'),
              actions: [
                // TextButton(onPressed: () {
                //   Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => HomePage()));
                // }, child: Text('No')),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/report',
                        (Route<dynamic> route) => false,
                  );
                  // Navigator.pop(context);
                }, child: Text('View Report'))
              ],
            )
    );
  }

  void showInstructionDialog() {
    showDialog(context: context,
        builder: (_) =>
            AlertDialog(
              title: Text('INSTRUCTIONS'),
              content: SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Instruction('Domain', 'Neet'),
                      Instruction('Test Name', 'General Physics and Motion in a Straight Line - 1'),
                      Instruction('No. Of Questions','45'),
                      Instruction('Allocated Time', '60Mins'),
                      Text('Navigation Tools'),
                      NavigationTool('Mark', '* Mark: To mark a question for review (To Respond Later), click on mark button.'),
                      NavigationTool('Flag', 'Flag: To flag a question (To respond later), choose an answer and click on flag button.'),
                      NavigationTool('Next', 'Next: By clicking Next button, the next question appears.'),
                      NavigationTool('Previous', 'Previous: By clicking Previous button, the previous question appears.'),
                      NavigationTool('End Test', 'End Test: By clicking End Test button, the test gets submitted.'),
                      Text('Standard Instructions', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      StandardInstructions('**Chapter Tests are autogenerated '),
                      StandardInstructions(' * The clock of 60 mins will be set at the server. The countdown timer in the top center of the screen will display the remaining time available for you to complete the test. When the timer reaches zero, the test will end by itself. You will not be required to end or submit your examination. '),
                      StandardInstructions('* The Test consists of 45 questions. The maximum marks are 180. '),
                      StandardInstructions('* Each question is allotted 4 (four) marks for correct response and 1(one) mark will be deducted for indicating incorrect response of each question. No deduction from the total score will be made if no response is indicated for an item.'),
                      StandardInstructions('* You can click on the arrow icon, appears to the top left of the screen, to collapse the question palette thereby maximizing the question window. To view the question palette again, click on the icon again. '),
                      StandardInstructions('* Procedure for answering a multiple-choice type question: a. To select you answer, click on the button of one of the options. b. To change your chosen answer, click on the button of another option c. To save your answer, you MUST click on the Next button. d. To mark the question for review, click on the Mark for Review button. '),
                      StandardInstructions('* To change your answer to a question that has already been answered, first select that question from question pallet for answering and then follow the procedure for answering that type of question. '),
                      StandardInstructions('* You can shuffle between sections and questions anything during the examination as per your convenience only during the time stipulated. '),
                      StandardInstructions('* Please contact your Test Administrator in case of a power failure as the test may be recovered. If test recovery is not possible then test will have to be rescheduled. '),
                      StandardInstructions('* In case of complete Internet failure, submission will not be possible & the test will have to be rescheduled. In case of temporary internet outage please wait for some time and try to resubmit the test. '),
                      StandardInstructions('* If the internet speed is unreasonably slow, images and tables in the question may take a little longer to appear. '),
                      StandardInstructions('* This is a Multiple-Choice Question (MCQ) type Test. You can go back to the previous questions. '),
                      Text('Help Center', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      StandardInstructions('1 - In case there is a power failure or internet connection breaks, the timer will stop at that very instant. The user can resume the test from where it was left.For test recovery or reschedule please contact your local administrator or write an email to myinsights.support@pearson.com mentioning your User Id.'),
                      Text('Security', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      StandardInstructions(' Once logged-in through one browser tab, user cannot login from any other browser/same browser tab.'),
                      Text('Legend', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
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
              ),
              actions: [
                TextButton(onPressed: () {
                  Navigator.pop(context);
                  // Navigator.pop(context);
                }, child: Text('Understand'))
              ],
            )
    );
  }

  _buildOption() {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 5),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
            Row(
            children: [
              Expanded(child: FlatButton(
                onPressed: () {},
                child: Text('Flag',),
                color: Colors.red,
              ),
              ),
              SizedBox(width: 2,),
              Expanded(child: FlatButton(
                onPressed: () {},
                child: Text('Mask'),
                color: Colors.blue,
              ),
              ),
              SizedBox(width: 2,),
            ],
          ),
          Row(
            children: [
              Expanded(child: FlatButton(
                onPressed: () {
                  nextQuestion();
                },
                child: Text('Next'),
                color: Colors.blueAccent,
              ),
              ),
              SizedBox(width: 2,),
              index == 0 ? Container() : Expanded(child: FlatButton(
                onPressed: () {
                  index == 0 ? null : prevQuestion();
                },
                child: Text('Previous'),
                color: Colors.cyan,
              ),
              ),
              SizedBox(width: 2,),
              Expanded(child: FlatButton(
                onPressed: () {
                  showCloseExamDialog();
                },
                child: Text('End Test'),
                color: Colors.red,
              ),
              ),
            ],
          ),
        ],
      ),
    ),
    );
  }

  Instruction(String heading, String text) {
    return Text('* ${heading}: ${text}', style: TextStyle(
      fontSize: 14,
    ),);
  }

  NavigationTool(String button, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RaisedButton(
          color: Colors.green,
          child: Text('${button}'),
          onPressed: () {},
        ),
        Text('${text}', style: TextStyle(
          fontSize: 14,
        ),)
      ],
    );
  }

  StandardInstructions(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('$text', style: TextStyle(fontSize: 14,),),
    );
  }

}


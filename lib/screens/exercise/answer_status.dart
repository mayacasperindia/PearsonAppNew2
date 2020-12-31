import 'package:flutter/material.dart';
import 'package:pearson_flutter/homepage.dart';
import 'package:pearson_flutter/screens/exercise/attended_answer_screen.dart';
import 'package:pearson_flutter/utils/config.dart';

class AnswerStatus extends StatefulWidget {
  @override
  _AnswerStatusState createState() => _AnswerStatusState();
}

class _AnswerStatusState extends State<AnswerStatus> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => AppConfig.goto(context, HomePage()),),
          title: Text('Exam Reports'),
        ),
        body: GridView.count(
          crossAxisCount: 4,
          children: List.generate(50,(index){
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AttendedAnswerScreen(),));
              },
              child: Container(
                child: Card(
                  elevation: 3,
                  color: Colors.green,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(index.toString()),
                      Text("Attended"),

                    ],
                  ),
                ),
              ),
            );
          }),
        ),
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
              title: Text('Reviewed'),
              content: Text('Want to go to homepage?'),
              actions: [
                TextButton(onPressed: () {
                  Navigator.of(context).pop();
                }, child: Text('No')),
                TextButton(onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/home',
                        (Route<dynamic> route) => false,
                  );
                  // Navigator.pop(context);
                }, child: Text('Yes'))
              ],
            )
    );
  }
}

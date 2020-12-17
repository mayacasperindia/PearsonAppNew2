import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pearson_flutter/homepage.dart';

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int secondsRemaining = 5;
  var enableResend = null;
  Timer timer;

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          // enableResend = Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
        });
      }
    });
  }

  void _resendCode() {
    //other code here
    setState(() {
      secondsRemaining = 5;
      enableResend = false;
    });
  }

  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Waiting Lounge',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
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
                'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) => value,
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )),
              ],
            ),
            Row(
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
            FlatButton(
              child: Text('Resend Code'),
              onPressed: enableResend,
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
    );
  }
}

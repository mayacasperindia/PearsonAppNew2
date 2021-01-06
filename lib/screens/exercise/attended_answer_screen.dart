import 'package:flutter/material.dart';

class AttendedAnswerScreen extends StatefulWidget {
  @override
  _AttendedAnswerScreenState createState() => _AttendedAnswerScreenState();
}

class _AttendedAnswerScreenState extends State<AttendedAnswerScreen> {

  int _selectedValue = 3;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text(
              "1: General Physics and Motion in a Straight Line",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 15),
            RadioListTile(
              title: Text("Scalars and Vectors"),
              value: 1,
              groupValue: _selectedValue,
            ),
            RadioListTile(
              title: Text("Motion in a Plane"),
              value: 2,
              groupValue: _selectedValue,
            ),
            RadioListTile(
              title: Text("Units and Measurements"),
              groupValue: _selectedValue,
              value: 3,
            ),
            RadioListTile(
              title: Text("Projectile Motion"),
              groupValue: _selectedValue,
              value: 4,
            ),

            Spacer(),
             Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("'You are Wrong! "),
                  Text('General Physics and Motion in a Straight Line'),
                  Text('Units and Measurements'),
                  Text('Mathematical Physics'),
                  Text('Motion in One Dimension'),
                  Text('Graphical Representation of Motion in One Dimension'),
                ],
              ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

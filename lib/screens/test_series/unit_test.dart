import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pearson_flutter/widgets/widgets.dart';
import 'package:pearson_flutter/unused/drawerExamWidget.dart';
import 'package:pearson_flutter/widgets/my_scaffold.dart';

class UnitTest extends StatefulWidget {
  @override
  _UnitTestState createState() => _UnitTestState();
}

class _UnitTestState extends State<UnitTest> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      padding: EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (context, index) => UnitTestCard(),
    );
  }
}

class UnitTestCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RCard(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'XI Physics Unit 1',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Test Frequency 0/3'),
          Divider(),
          Row(
            children: [
              Expanded(
                child: OutlineButton(
                  onPressed: () {},
                  child: Text('Syllabus'),
                  textColor: Theme.of(context).primaryColor,
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                  highlightedBorderColor: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Start',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Theme.of(context).buttonColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

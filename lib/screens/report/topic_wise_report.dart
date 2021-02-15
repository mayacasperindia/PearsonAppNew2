import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pearson_flutter/screens/report/questions_preview.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/widgets.dart';

class TopicWiseReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          IconLabel(Icons.local_library, "Topic-wise report"),
          Divider(height: 1),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Table(
              children: [
                TableRow(children: [
                  Column(children: [
                    Text(
                      'Subject',
                      textScaleFactor: 0.9,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ]),
                  Column(children: [
                    Text(
                      'Questions',
                      textScaleFactor: 0.9,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ]),
                  Column(children: [
                    Text(
                      'Correct',
                      textScaleFactor: 0.9,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ]),
                  Column(children: [
                    Text(
                      'Marks',
                      textScaleFactor: 0.9,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ]),
                  Column(children: [
                    Text(
                      '%',
                      textScaleFactor: 0.9,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ]),
                ]),
                TableRow(children: [
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ]),
                TableRow(children: [
                  Column(children: [
                    Text(
                      'Math',
                      textScaleFactor: 0.85,
                    )
                  ]),
                  Column(children: [
                    Text(
                      '100',
                      textScaleFactor: 0.85,
                    )
                  ]),
                  Column(children: [
                    Text(
                      '50/100',
                      textScaleFactor: 0.85,
                    )
                  ]),
                  Column(children: [
                    Text(
                      '50/100',
                      textScaleFactor: 0.85,
                    )
                  ]),
                  Column(children: [
                    Text(
                      '50',
                      textScaleFactor: 0.85,
                    )
                  ]),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

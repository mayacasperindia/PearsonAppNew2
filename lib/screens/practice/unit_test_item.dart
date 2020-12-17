import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/widgets/widgets.dart';

class UnitTestItem extends StatelessWidget {
  final bool enabled;

  const UnitTestItem({Key key, this.enabled = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RCard(
      color: enabled
          ? Theme.of(context).accentColor
          : Theme.of(context).disabledColor,
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'XI Physics Unit 1',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  enabled ? 'Frequency 0/3' : "Frequency 3/3",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                Divider(endIndent: 30),
                SizedBox(
                  height: 24,
                  child: FlatButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          FluentSystemIcons.ic_fluent_notebook_filled,
                          size: 12,
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            'View Syllabus'.toUpperCase(),
                            textScaleFactor: 0.8,
                          ),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.zero,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            FluentSystemIcons.ic_fluent_arrow_right_circle_filled,
            color: enabled ? Colors.white : Colors.white30,
            size: 32,
          )
        ],
      ),
    );
  }
}

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/screens/exercise/exerciseScreen.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/bottom_sheet.dart';
import 'package:pearson_flutter/widgets/widgets.dart';

class ProctoredTestItem extends StatefulWidget {
  final bool enabled;

  const ProctoredTestItem({Key key, this.enabled = true}) : super(key: key);

  @override
  _ProctoredTestItemState createState() => _ProctoredTestItemState();
}

class _ProctoredTestItemState extends State<ProctoredTestItem> {
  BottomSheetWidget syllabusModal = new BottomSheetWidget();

  @override
  Widget build(BuildContext context) {
    return RCard(
      color: widget.enabled
          ? Theme.of(context).accentColor
          : AppConfig.kSuccessColor,
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
                  widget.enabled ? 'Frequency 0/3' : "Frequency 3/3",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                Divider(endIndent: 30),
                SizedBox(
                  height: 24,
                  child: FlatButton(
                    onPressed: () => syllabusModal.mainBottomSheet(context),
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
          IconButton(
            icon: Icon(
              FluentSystemIcons.ic_fluent_arrow_right_circle_filled,
              color: widget.enabled
                  ? Colors.white
                  : Theme.of(context).disabledColor,
              size: 32,
            ),
            onPressed: () {
              if (!widget.enabled) {
                AppConfig.presentMessage(context,
                    message: "You have already taken the test!");
                return;
              }

              AppConfig.goto(
                context,
                ExerciseScreen(proctoredTest: true, nonProctoredTest: true,),
              );
            },
          )
        ],
      ),
    );
  }
}

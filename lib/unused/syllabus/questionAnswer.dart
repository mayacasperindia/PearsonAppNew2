import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/utils/config.dart';

class Card3 extends StatefulWidget {

  final int index;

  const Card3({Key key, this.index}) : super(key: key);

  @override
  _Card3State createState() => _Card3State();
}

class _Card3State extends State<Card3> {

  @override
  Widget build(BuildContext context) {

    buildList() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text('Units and Measurements'),
                ),
                Divider(),
                Container(
                  child: Text('Mathematical Physics'),
                ),
                Divider(),
                Container(
                  child: Text('Motion in One Dimension'),
                ),
                Divider(),
                Container(
                  child: Text('Graphical Representation of Motion in One Dimension'),
                ),
                Divider(),

              ],
            ),
          ],
        ),
      );
    }

    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2, top: 2, left: 10, right: 10),
          child: ScrollOnExpand(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
              ),

              elevation: 5,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToExpand: true,
                      tapBodyToCollapse: false,
                      hasIcon: false,
                      useInkWell: true,
                      animationDuration: Duration(milliseconds: 500),
                      expandIcon: Icons.arrow_circle_up,
                      collapseIcon: Icons.arrow_circle_down,
                    ),
                    header: Container(
                      color: Theme.of(context).buttonColor,
                      padding: EdgeInsets.all(5),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            ExpandableIcon(
                              theme: const ExpandableThemeData(
                                expandIcon: Icons.arrow_right,
                                collapseIcon: Icons.arrow_drop_down,
                                iconColor: Colors.white,
                                iconSize: 28.0,
                                iconPadding: EdgeInsets.only(right: 5),
                                hasIcon: false,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "${widget.index + 1}: General Physics and Motion in One-Dimension",
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    expanded: buildList(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
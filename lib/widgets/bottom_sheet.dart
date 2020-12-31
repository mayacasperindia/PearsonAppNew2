
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/widgets/widgets.dart';

class BottomSheetWidget {
  ScrollController _controller = ScrollController();

  mainBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      // isScrollControlled: true,
      builder: (BuildContext context) {
        return  DraggableScrollableSheet(
            initialChildSize: 0.75, //set this as you want
            maxChildSize: 0.75, //set this as you want
            minChildSize: 0.75, //set this as you want
            expand: false,
            builder: (context, scrollController) {
              return ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RCard(
                      color: Theme.of(context).accentColor,
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
                                  'Physics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Class: 9th",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ),
                                ),
                                Divider(endIndent: 30),
                                SizedBox(
                                  height: 24,
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
                                          'Content'.toUpperCase(),
                                          textScaleFactor: 0.8,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(endIndent: 30),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Kinematics',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Force and Laws of Motion',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Basics Physics',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    // Card(
                    //   elevation: 5,
                    //   child: Container(
                    //     padding: EdgeInsets.all(15),
                    //     child: Column(
                    //       children: [
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           mainAxisSize: MainAxisSize.max,
                    //           children: [
                    //             Text('Sno.', textScaleFactor: 1.2, style: TextStyle(
                    //                 fontWeight: FontWeight.w600
                    //             ),),
                    //             Text('1')
                    //           ],
                    //         ),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           mainAxisSize: MainAxisSize.max,
                    //           children: [
                    //             Text('Class:', textScaleFactor: 1.2, style: TextStyle(
                    //                 fontWeight: FontWeight.w600
                    //             ),),
                    //             Text('9th')
                    //           ],
                    //         ),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           mainAxisSize: MainAxisSize.max,
                    //           children: [
                    //             Text('Subject: ', textScaleFactor: 1.2, style: TextStyle(
                    //                 fontWeight: FontWeight.w600
                    //             ),),
                    //             Text('Physics')
                    //           ],
                    //         ),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           mainAxisSize: MainAxisSize.max,
                    //           children: [
                    //             Text('Topic: ', textScaleFactor: 1.2, style: TextStyle(
                    //                 fontWeight: FontWeight.w600
                    //             ),),
                    //             Column(
                    //               crossAxisAlignment: CrossAxisAlignment.end,
                    //               children: [
                    //                 Text('Kinematics'),
                    //                 Text('Force and Laws of Motion'),
                    //                 Text('Basics Physics'),
                    //               ],
                    //             )
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
              ); //whatever you're returning, does not have to be a Container
            }
        );
      },
    );
  }
}
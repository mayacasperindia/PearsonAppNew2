import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pearson_flutter/homepage.dart';
import 'package:pearson_flutter/widgets/widgets.dart';

class DialogPopup2 extends StatefulWidget {
  @override
  _DialogPopup2State createState() => _DialogPopup2State();
}

class _DialogPopup2State extends State<DialogPopup2> {
  var _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        key: _key,
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () {},
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              width: double.maxFinite,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height - 250,
              ),
              child: Hero(
                tag: "request",
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Add Access Code",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "You can add a voucher code here to activate a new syllabus. To buy the access code for any syllabus, please contact your institute or myinsights.support@pearson.com.",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                      Divider(indent: 15, endIndent: 15),
                      Flexible(
                        child: SingleChildScrollView(
                          child: InputField(
                            hint: "Enter the Code",
                            label: 'Access Code:',
                            fillColor: Colors.white,
                            textColor: Colors.black,
                            formatter: [
                              LengthLimitingTextInputFormatter(40),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(width: 15),
                          Flexible(
                            child: OutlineButton(
                              textColor: Theme.of(context).iconTheme.color,
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: Text('Close'.toUpperCase()),
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: FlatButton(
                              color: Theme.of(context).accentColor,
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: Text('Submit'.toUpperCase()),
                            ),
                          ),
                          SizedBox(width: 15),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

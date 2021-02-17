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
              height: 400,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              width: double.maxFinite,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height - 100,
              ),
              child: Hero(
                tag: "request",
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Add Access Code",
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 20
                                  ),
                                ),

                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, color: Theme.of(context).secondaryHeaderColor),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "You can add a voucher code here to activate a new syllabus. To buy the access code for any syllabus, please contact your institute or myinsights.support@pearson.com.",
                          style:
                          Theme.of(context).textTheme.caption.copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: [

                                InputField(
                                  // hint: "Enter the School Name",
                                  label: 'Access Code',
                                  // suffixIcon: Icons.school_outlined,
                                  fillColor: Colors.white,
                                  required: true,
                                  textColor: Colors.black,
                                  formatter: [
                                    LengthLimitingTextInputFormatter(
                                        40),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      FlatButton(
                                        color: Theme.of(context).accentColor,
                                        textColor: Colors.white,
                                        onPressed: () {
                                          Navigator.pop(context, HomePage());
                                        },
                                        child: Text('Submit'.toUpperCase()),
                                      ),
                                      FlatButton(
                                        color: Theme.of(context).accentColor,
                                        textColor: Colors.white,
                                        onPressed: () {
                                          Navigator.pop(context, HomePage());
                                        },
                                        child: Text('Close'.toUpperCase()),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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

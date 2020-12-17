import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pearson_flutter/homepage.dart';
import 'package:pearson_flutter/widgets/widgets.dart';

class DialogPopup extends StatefulWidget {
  @override
  _DialogPopupState createState() => _DialogPopupState();
}

class _DialogPopupState extends State<DialogPopup> {
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
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Text(
                                    "Ready to get started?",
                                    style: Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Schedule a demo with us and start preparing students for their exams",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.close,
                                color: Theme.of(context).secondaryHeaderColor),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                      Divider(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: InputField(
                                        label: "First Name",
                                        fillColor: Colors.white,
                                        required: true,
                                        textColor: Colors.black,
                                        lessRightMargin: true,
                                        suffixIcon: CupertinoIcons.person,
                                        capitalization:
                                            TextCapitalization.words,
                                      ),
                                    ),
                                    Expanded(
                                      child: InputField(
                                        label: "Last Name",
                                        required: true,
                                        fillColor: Colors.white,
                                        textColor: Colors.black,
                                        capitalization:
                                            TextCapitalization.words,
                                        lessLeftMargin: true,
                                        suffixIcon: CupertinoIcons.person,
                                      ),
                                    ),
                                  ],
                                ),
                                InputField(
                                  // hint: "Enter the School Name",
                                  label: 'Corporate / Institute Name',
                                  suffixIcon: Icons.school_outlined,
                                  fillColor: Colors.white,
                                  required: true,
                                  textColor: Colors.black,
                                  formatter: [
                                    LengthLimitingTextInputFormatter(40),
                                  ],
                                ),
                                InputField(
                                  // hint: "Enter the School Name",
                                  label: 'Email',
                                  suffixIcon: Icons.email_outlined,
                                  fillColor: Colors.white,
                                  required: true,
                                  textColor: Colors.black,
                                  formatter: [
                                    LengthLimitingTextInputFormatter(25),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: InputField(
                                        // hint: "Select Board",
                                        label: "Mobile Number",
                                        required: true,
                                        fillColor: Colors.white,
                                        textColor: Colors.black,
                                        lessRightMargin: true,
                                        // suffixIcon: CupertinoIcons.person,
                                        capitalization:
                                            TextCapitalization.words,
                                      ),
                                    ),
                                    Expanded(
                                      child: InputField(
                                        // hint: "XII",
                                        label: "Pincode",
                                        required: true,
                                        fillColor: Colors.white,
                                        textColor: Colors.black,
                                        capitalization:
                                            TextCapitalization.words,
                                        lessLeftMargin: true,
                                        // suffixIcon: CupertinoIcons.person,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: InputField(
                                        label: "City",
                                        required: true,
                                        fillColor: Colors.white,
                                        textColor: Colors.black,
                                        lessRightMargin: true,
                                        // suffixIcon: CupertinoIcons.person,
                                        capitalization:
                                            TextCapitalization.words,
                                      ),
                                    ),
                                    Expanded(
                                      child: InputField(
                                        hint: "Select the State",
                                        label: "State",
                                        required: true,
                                        fillColor: Colors.white,
                                        textColor: Colors.black,
                                        capitalization:
                                            TextCapitalization.words,
                                        lessLeftMargin: true,
                                        // suffixIcon: CupertinoIcons.person,
                                      ),
                                    ),
                                  ],
                                ),
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                        color: Theme.of(context).buttonColor,
                                      )),
                                  elevation: 5,
                                  color: Theme.of(context).buttonColor,
                                  padding: const EdgeInsets.all(10),
                                  disabledColor: Theme.of(context).primaryColor,
                                  disabledTextColor: Colors.white,
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                    );
                                  },
                                  child: Text(
                                    'Request a Demo',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
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

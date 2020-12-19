import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pearson_flutter/homepage.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/widgets.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String dropdownValue = 'Select Board';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      // required: true,
                      textColor: Colors.black,
                      lessRightMargin: true,
                      suffixIcon: CupertinoIcons.person,
                      capitalization: TextCapitalization.words,
                    ),
                  ),
                  Expanded(
                    child: InputField(
                      label: "Last Name",
                      // required: true,
                      fillColor: Colors.white,
                      textColor: Colors.black,
                      capitalization: TextCapitalization.words,
                      lessLeftMargin: true,
                      suffixIcon: CupertinoIcons.person,
                    ),
                  ),
                ],
              ),
              InputField(
                // hint: "Enter the School Name",
                label: 'Email',
                suffixIcon: Icons.email_outlined,
                fillColor: Colors.white,
                // required: true,
                textColor: Colors.black,
                formatter: [
                  LengthLimitingTextInputFormatter(25),
                ],
              ),
              InputField(
                hint: "Enter the School Name",
                label: 'School name',
                suffixIcon: Icons.school_outlined,
                fillColor: Colors.white,
                // required: true,
                textColor: Colors.black,
                formatter: [
                  LengthLimitingTextInputFormatter(40),
                ],
              ),
              // InputField(
              //   hint: "CBSC",
              //   label: 'Board',
              //   suffixIcon: Icons.school_outlined,
              //   fillColor: Colors.white,
              //   required: true,
              //   textColor: Colors.black,
              //   formatter: [
              //     LengthLimitingTextInputFormatter(40),
              //   ],
              // ),
              SizedBox(
                height: 5,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Board".toUpperCase(),
                    textScaleFactor: 0.9,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 11,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .color
                          .withOpacity(0.75),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.87,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 0.5
                      ),
                      borderRadius:
                          BorderRadius.circular(AppConfig.kRadiusSmall),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8, top: 0, bottom: 0,right:5 ),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        elevation: 16,
                        // style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 0,
                          // color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['Select Board', 'CBSC', 'ICSC']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Text(value,overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1,
                                    color: Colors.black38
                                  ),)),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),

              Row(
                children: <Widget>[
                  Expanded(
                    child: InputField(
                      // hint: "Select Board",
                      label: "Mobile Number",
                      // required: true,
                      fillColor: Colors.white,
                      textColor: Colors.black,
                      lessRightMargin: true,
                      // suffixIcon: CupertinoIcons.person,
                      capitalization: TextCapitalization.words,
                    ),
                  ),
                  Expanded(
                    child: InputField(
                      hint: "XII",
                      label: "Class",
                      // required: true,
                      fillColor: Colors.white,
                      textColor: Colors.black,
                      capitalization: TextCapitalization.words,
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
                      label: "School City",
                      hint: "City",
                      // required: true,
                      fillColor: Colors.white,
                      textColor: Colors.black,
                      lessRightMargin: true,
                      // suffixIcon: CupertinoIcons.person,
                      capitalization: TextCapitalization.words,
                    ),
                  ),
                  Expanded(
                    child: InputField(
                      hint: "Select the State",
                      label: "School State",
                      // required: true,
                      fillColor: Colors.white,
                      textColor: Colors.black,
                      capitalization: TextCapitalization.words,
                      lessLeftMargin: true,
                      // suffixIcon: CupertinoIcons.person,
                    ),
                  ),
                ],
              ),
              FlatButton(
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text('Submit'.toUpperCase()),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pearson_flutter/homepage.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/widgets.dart';

class Password extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              InputField(
                // hint: "Enter the School Name",
                label: 'Current Password',
                // suffixIcon: Icons.email_outlined,
                fillColor: Colors.white,
                // required: true,
                textColor: Colors.black,
                formatter: [
                  LengthLimitingTextInputFormatter(25),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              InputField(
                // hint: "Enter the School Name",
                label: 'New Password',
                // suffixIcon: Icons.school_outlined,
                fillColor: Colors.white,
                // required: true,
                textColor: Colors.black,
                formatter: [
                  LengthLimitingTextInputFormatter(40),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              InputField(
                // hint: "Enter the School Name",
                label: 'Re-type New Password',
                // suffixIcon: Icons.school_outlined,
                fillColor: Colors.white,
                // required: true,
                textColor: Colors.black,
                formatter: [
                  LengthLimitingTextInputFormatter(40),
                ],
              ),
              SizedBox(
                height: 5,
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

              //
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
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pearson_flutter/screens/registration/sign_up.dart';
import 'package:pearson_flutter/screens/registration/login.dart';
import 'package:pearson_flutter/widgets/widgets.dart';

class ForgetPw extends StatefulWidget {
  @override
  _ForgetPwState createState() => _ForgetPwState();
}

class _ForgetPwState extends State<ForgetPw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          // height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(),
                SizedBox(),
                Center(
                  child: Image.asset("assets/images/logo.png"),
                ),

                Center(
                  child: Image.asset(
                    "assets/images/login.png",
                    scale: 2.5,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Text(
                        "Forget Password",
                        textScaleFactor: 1.5,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Enter your Registered Email ID below to reset your Password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    InputField(
                      hint: "Enter the Email Address",
                      label: "Email",
                      fillColor: Colors.white10,
                      suffixIcon: Icons.email_outlined,
                      textColor: Colors.black,
                      required: true,
                      formatter: [
                        LengthLimitingTextInputFormatter(25),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        width: 300,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color: Theme.of(context).secondaryHeaderColor)),
                          elevation: 10,
                          color: Theme.of(context).secondaryHeaderColor,
                          padding: const EdgeInsets.all(10),
                          disabledColor: Theme.of(context).secondaryHeaderColor,
                          disabledTextColor: Colors.white,
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()),
                            ),
                          },
                          child: InkWell(
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              ),
                            },
                            child: Text(
                              'Submit',
                              style:
                                  TextStyle(fontSize: 20,
                                      color: Theme.of(context).primaryColor
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text("Exiting User?", style: TextStyle(
                //         fontSize: 15,
                //       ),),
                //       InkWell(
                //         onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(builder: (context) =>LoginPage()),
                //           );
                //         },
                //         child: Text("Login", style: TextStyle(
                //           color: Theme.of(context).secondaryHeaderColor,
                //           decoration: TextDecoration.underline,
                //           fontSize: 18,
                //         ),),
                //       ), Text("Here!", style: TextStyle(
                //         fontSize: 15,
                //       ),),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

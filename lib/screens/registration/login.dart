import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pearson_flutter/homepage.dart';
import 'package:pearson_flutter/screens/registration/forgot_password.dart';
import 'package:pearson_flutter/screens/registration/voucher.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/widgets.dart';
import 'package:pearson_flutter/screens/app/request_a_demo.dart';
import 'package:pearson_flutter/widgets/my_scaffold.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class
LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // SharedPreferences localStorage;
  //
  // Future init() async {
  //   localStorage = await SharedPreferences.getInstance();
  // }

  // Future<void> main() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var email = prefs.getString('email');
  //   print(email);
  //   runApp(MaterialApp(home: email == null ? LoginPage() : HomePage()));
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   main();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      // floatingButton: FloatingActionButton(
      //   backgroundColor: Theme.of(context).buttonColor,
      //   child: Icon(CupertinoIcons.chat_bubble_text_fill),
      //   onPressed: () {
      //     //TODO: launch
      //   },
      // ),
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Center(
        //       child: FlatButton(
        //         onPressed: () =>
        //             AppConfig.presentDialogWithChild(context, DialogPopup()),
        //         child: Text(
        //           "Request demo".toUpperCase(),
        //           textScaleFactor: 0.8,
        //         ),
        //         textColor: Colors.white,
        //         color: Theme.of(context).buttonColor,
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "assets/images/login.png",
                  height: 160,
                ),
              ),
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Login to your MyInsights account",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SizedBox(height: 10),
              InputField(
                hint: "Enter username",
                label: 'Username',
                fillColor: Theme.of(context).canvasColor,
                controller: _emailController,
                suffixIcon: CupertinoIcons.person_solid,
                formatter: [
                  LengthLimitingTextInputFormatter(25),
                ],
              ),
              SizedBox(height: 2),
              InputField(
                hint: "Enter the password",
                label: 'Password',
                controller: _passwordController,
                suffixIcon: CupertinoIcons.lock_fill,
                fillColor: Theme.of(context).canvasColor,
                formatter: [
                  LengthLimitingTextInputFormatter(25),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      FlatButton(
                        textColor: Theme.of(context).accentColor,
                        onPressed: () => AppConfig.goto(context, DialogPopup()),
                        child: Text(
                          "Request Demo",textScaleFactor: 1.2,style: TextStyle(
                          decoration: TextDecoration.underline,

                        ),
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(
                        textColor: Theme.of(context).accentColor,
                        onPressed: () => AppConfig.goto(context, ForgetPw()),
                        child: Text(
                          "Forgot Password?",textScaleFactor: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: FlatButton(
                    color: Theme.of(context).accentColor,
                    onPressed: () =>
                        AppConfig.goto(context, HomePage(), replace: true),
                    child: Text('Sign in'.toUpperCase()),
                    textColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        Text("New User?"),
                        SizedBox(width: 5),
                        InkWell(
                          onTap: () =>
                              AppConfig.goto(context, VoucherCheck(), replace: true),
                          child: Text(
                            "Sign up",textScaleFactor: 1.2,
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text("here"),

                      ],
                    ),

                    FlatButton(
                      textColor: Theme.of(context).accentColor,
                      onPressed: () => launch('https://myinsights.in.pearson.com'),
                      child: Text(
                        "Support".toUpperCase(),textScaleFactor: 0.9,style: TextStyle(
                        // color: Theme.of(context).accentColor,
                        decoration: TextDecoration.underline,
                        // fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }

// _save() async {
//   localStorage.setString('email', _emailController.text.toString());
//   localStorage.setString('password', _passwordController.text.toString());
// }
}

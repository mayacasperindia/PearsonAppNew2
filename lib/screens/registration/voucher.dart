import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pearson_flutter/homepage.dart';
import 'package:pearson_flutter/screens/registration/account_detail.dart';
import 'package:pearson_flutter/screens/registration/sign_up.dart';
import 'package:pearson_flutter/screens/registration/login.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/widgets.dart';
import 'package:pearson_flutter/widgets/my_scaffold.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
              SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Sign up with MyInsights",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SizedBox(height: 10),
              InputField(
                hint: "Enter the voucher code",
                label: 'Voucher Code',
                suffixIcon: Icons.card_giftcard,
                fillColor: Theme.of(context).canvasColor,
                required: true,
                formatter: [
                  LengthLimitingTextInputFormatter(25),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: FlatButton(
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    onPressed: () => AppConfig.goto(context, EmailPage()),
                    child: Text('Next'.toUpperCase()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Exiting user? ",
                    ),
                    InkWell(
                      onTap: () =>
                          AppConfig.goto(context, LoginPage(), replace: true),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(" here."),
                  ],
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}

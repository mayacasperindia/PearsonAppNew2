import 'package:flutter/material.dart';
import 'package:pearson_flutter/homepage.dart';
import 'package:pearson_flutter/screens/registration/sign_up.dart';
import 'package:pearson_flutter/screens/registration/voucher.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/my_scaffold.dart';
import 'package:pearson_flutter/widgets/widgets.dart';

class EmailPage extends StatefulWidget {
  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/logo.png"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/images/login.png",
                height: 160,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Sign Up to your Myinsights account",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(height: 20),
            InputField(
              hint: "Enter your email id",
              label: "Email",
              fillColor: Theme.of(context).canvasColor,
              required: true,
              suffixIcon: Icons.email,
              capitalization: TextCapitalization.words,
            ),
            InputField(
              hint: "Enter your Password",
              label: "Password",
              required: true,
              fillColor: Theme.of(context).canvasColor,
              capitalization: TextCapitalization.words,
              suffixIcon: Icons.lock,
            ),
            InputField(
              label: "Re-Enter Password",
              hint: "Re-Enter your Password",
              required: true,
              fillColor: Theme.of(context).canvasColor,
              suffixIcon: Icons.lock,
              capitalization: TextCapitalization.words,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: FractionallySizedBox(
                widthFactor: 1,
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  padding: const EdgeInsets.all(10),
                  textColor: Colors.white,
                  onPressed: () => AppConfig.popGoto(context, SignUp()),
                  child: Text('Next'.toUpperCase()),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: FractionallySizedBox(
                widthFactor: 1,
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  padding: const EdgeInsets.all(10),
                  textColor: Colors.white,
                  onPressed: () => AppConfig.popGoto(context, SignUp()),
                  child: Text('Previous'.toUpperCase()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

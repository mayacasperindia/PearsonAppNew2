import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pearson_flutter/homepage.dart';
import 'package:pearson_flutter/screens/registration/voucher.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/widgets.dart';
import 'package:pearson_flutter/widgets/my_scaffold.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var firstNameController,
      lastNameController,
      classController,
      stateController,
      schoolCityController,
      boardController,
      schoolNameController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    classController = TextEditingController();
    stateController = TextEditingController();
    schoolCityController = TextEditingController();
    schoolNameController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

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
        child: Form(
          key: _formKey,
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
                  "Signup with Myinsights",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: InputField(
                      label: "First Name",
                      controller: firstNameController,
                      required: true,
                      validator: (t) {
                        if (t.trim().isEmpty) {
                          return "Required Field";
                        } else
                          return null;
                      },
                      fillColor: Theme.of(context).canvasColor,
                      lessRightMargin: true,
                      suffixIcon: Icons.person,
                      capitalization: TextCapitalization.words,
                    ),
                  ),
                  Expanded(
                    child: InputField(
                      label: "Last Name",
                      controller: lastNameController,
                      fillColor: Theme.of(context).canvasColor,
                      required: true,
                      validator: (t) {
                        if (t.trim().isEmpty) {
                          return "Required Field";
                        } else
                          return null;
                      },
                      capitalization: TextCapitalization.words,
                      lessLeftMargin: true,
                      suffixIcon: Icons.person,
                    ),
                  ),
                ],
              ),
              InputField(
                hint: "Select Board",
                label: "Board",
                controller: boardController,
                fillColor: Theme.of(context).canvasColor,
                required: true,
                validator: (t) {
                  if (t.trim().isEmpty) {
                    return "Required Field";
                  } else
                    return null;
                },
                suffixIcon: Icons.layers,
                capitalization: TextCapitalization.words,
              ),
              InputField(
                hint: "eg. XII",
                label: "Class",
                required: true,
                controller: classController,
                fillColor: Theme.of(context).canvasColor,
                capitalization: TextCapitalization.words,
                suffixIcon: Icons.confirmation_number,
                validator: (t) {
                  if (t.trim().isEmpty) {
                    return "Required Field";
                  } else
                    return null;
                },
              ),
              InputField(
                label: "School State",
                hint: "Select state",
                required: true,
                controller: stateController,
                fillColor: Theme.of(context).canvasColor,
                suffixIcon: Icons.map,
                capitalization: TextCapitalization.words,
                validator: (t) {
                  if (t.trim().isEmpty) {
                    return "Required Field";
                  } else
                    return null;
                },
              ),
              InputField(
                label: "School City",
                hint: "Enter city name",
                controller: schoolCityController,
                fillColor: Theme.of(context).canvasColor,
                required: true,
                capitalization: TextCapitalization.words,
                suffixIcon: Icons.location_city,
                validator: (t) {
                  if (t.trim().isEmpty) {
                    return "Required Field";
                  } else
                    return null;
                },
              ),
              InputField(
                hint: "Enter the School Name",
                label: 'School Name',
                controller: schoolNameController,
                suffixIcon: Icons.school,
                required: true,
                fillColor: Theme.of(context).canvasColor,
                formatter: [
                  LengthLimitingTextInputFormatter(25),
                ],
                validator: (t) {
                  if (t.trim().isEmpty) {
                    return "Required Field";
                  } else
                    return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Wrap(
                  children: [
                    Text(
                      "By submitting, you agree to our ",
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Terms and Policy",
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text("."),
                  ],
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
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        AppConfig.popGoto(context, HomePage());
                      } else {}
                    },
                    child: Text('Submit'.toUpperCase()),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

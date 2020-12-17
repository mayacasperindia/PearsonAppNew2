import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pearson_flutter/homepage.dart';
import 'package:pearson_flutter/screens/registration/voucher.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/widgets.dart';
import 'package:pearson_flutter/widgets/my_scaffold.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
                    required: true,
                    fillColor: Theme.of(context).canvasColor,
                    lessRightMargin: true,
                    suffixIcon: Icons.person,
                    capitalization: TextCapitalization.words,
                  ),
                ),
                Expanded(
                  child: InputField(
                    label: "Last Name",
                    fillColor: Theme.of(context).canvasColor,
                    required: true,
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
              fillColor: Theme.of(context).canvasColor,
              required: true,
              suffixIcon: Icons.layers,
              capitalization: TextCapitalization.words,
            ),
            InputField(
              hint: "eg. XII",
              label: "Class",
              required: true,
              fillColor: Theme.of(context).canvasColor,
              capitalization: TextCapitalization.words,
              suffixIcon: Icons.confirmation_number,
            ),
            InputField(
              label: "School State",
              hint: "Select state",
              required: true,
              fillColor: Theme.of(context).canvasColor,
              suffixIcon: Icons.map,
              capitalization: TextCapitalization.words,
            ),
            InputField(
              label: "School City",
              hint: "Enter city name",
              fillColor: Theme.of(context).canvasColor,
              required: true,
              capitalization: TextCapitalization.words,
              suffixIcon: Icons.location_city,
            ),
            InputField(
              hint: "Enter the School Name",
              label: 'School Name',
              suffixIcon: Icons.school,
              required: true,
              fillColor: Theme.of(context).canvasColor,
              formatter: [
                LengthLimitingTextInputFormatter(25),
              ],
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
                  onPressed: () => AppConfig.popGoto(context, HomePage()),
                  child: Text('Submit'.toUpperCase()),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

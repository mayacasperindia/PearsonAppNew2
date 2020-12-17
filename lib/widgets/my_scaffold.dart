import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget body;
  final Widget floatingButton;

  const MyScaffold({Key key, this.appBar, this.body, this.floatingButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingButton,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            appBar == null
                ? SizedBox.shrink()
                : SizedBox(
                    child: SafeArea(child: appBar),
                  ),
            Expanded(child: body ?? SizedBox.shrink())
          ],
        ),
      ),
    );
  }
}

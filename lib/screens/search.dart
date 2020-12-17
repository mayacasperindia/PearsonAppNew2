import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/widgets/widgets.dart';
import 'package:pearson_flutter/widgets/my_scaffold.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: InputField(
          margin: EdgeInsets.zero,
          hint: "Search...",
          fillColor: Colors.white,
          prefixIcon: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            visualDensity: VisualDensity.compact,
            onPressed: () => Navigator.pop(context),
          ),
          suffixIcon: CupertinoIcons.search,
        ),
      ),
    );
  }
}

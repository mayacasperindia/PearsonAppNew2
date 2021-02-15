import 'package:flutter/material.dart';

class TopicPicker extends StatelessWidget {
  final List<String> items;
  final String hint;
  final Function(String v) onChange;
  final String value;

  const TopicPicker({Key key, this.items, this.hint, this.onChange, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DropdownButtonFormField(
          style: Theme.of(context).textTheme.bodyText1,
          value: value,
          isDense: true,
          isExpanded: true,
          hint: Text(hint ?? "Select option"),
          items: items
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          onChanged: onChange,
        ),
      ),
    );
  }
}

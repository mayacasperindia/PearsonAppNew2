import 'package:flutter/material.dart';
import 'package:pearson_flutter/utils/config.dart';

class SyllabusPicker extends StatefulWidget {
  final List<String> syllabus;
  final Function(String v) onChange;

  const SyllabusPicker({Key key, this.syllabus, this.onChange})
      : super(key: key);

  @override
  _SyllabusPickerState createState() => _SyllabusPickerState();
}

class _SyllabusPickerState extends State<SyllabusPicker> {
  String _selectedSyllabus;

  @override
  void initState() {
    if (widget.syllabus?.isNotEmpty ?? false) {
      _selectedSyllabus = widget.syllabus[0];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(maxWidth: 240, maxHeight: 40),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          child: FlatButton(
            onPressed: null,
            padding: EdgeInsets.all(5),
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      _selectedSyllabus ?? "<select>",
                      maxLines: 1,
                      // textScaleFactor: 0.5,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
            // shape: RoundedRectangleBorder(
            //   side: BorderSide(
            //     color: Theme.of(context).accentColor,
            //   ),
            //   borderRadius: BorderRadius.circular(AppConfig.kRadiusSmallest),
            // ),
            // disabledColor: Theme.of(context).accentColor.withOpacity(0.1),
            disabledTextColor: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
      onSelected: (v) {
        setState(() {
          _selectedSyllabus = v;
        });
        widget.onChange(v);
      },
      itemBuilder: (_) =>
          widget.syllabus
              ?.map(
                (e) => PopupMenuItem(
                  value: e,
                  child: Text(
                    "$e",
                    textScaleFactor: 0.7,
                  ),
                ),
              )
              ?.toList() ??
          [],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pearson_flutter/utils/config.dart';

class ReportsPicker extends StatefulWidget {
  final List<String> subject;
  final String select;
  final Function(String v) onChange;

  const ReportsPicker({Key key, this.subject,  this.select, this.onChange})
      : super(key: key);

  @override
  _ReportsPickerState createState() => _ReportsPickerState();
}

class _ReportsPickerState extends State<ReportsPicker> {
  String _selectedsubject;

  @override
  void initState() {
    if (widget.subject?.isNotEmpty ?? false) {
      _selectedsubject = widget.select;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9, maxHeight: 48),
        child: FlatButton(
          onPressed: null,
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedsubject ?? "<select>",
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
              Divider(height: 1),
            ],
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
      onSelected: (v) {
        setState(() {
          _selectedsubject = v;
        });
        widget.onChange(v);
      },
      itemBuilder: (_) =>
      widget.subject
          ?.map(
            (e) => PopupMenuItem(
          value: e,
          child: Text("$e",textScaleFactor:0.7,),
        ),
      )
          ?.toList() ??
          [],
    );
  }
}
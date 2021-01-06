import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pearson_flutter/utils/config.dart';

class InputField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData prefix;
  final Widget prefixIcon;
  final IconData suffixIcon;
  final String helpText;
  final TextInputType inputType;
  final TextCapitalization capitalization;
  final bool enable;
  final bool lessLeftMargin;
  final bool lessRightMargin;
  final bool noTopMargin;
  final TextEditingController controller;
  final Function(String str) validator;
  final List<TextInputFormatter> formatter;
  final FocusNode focusNode;
  final bool autoFocus;
  final String error;
  final Widget suffixWidget;
  final bool required;
  final int minLines;
  final int maxLines;
  final Color fillColor;
  final Color textColor;
  final void Function(String v) onChanged;
  final EdgeInsets margin;

  const InputField({
    Key key,
    this.label,
    this.prefix,
    this.onChanged,
    this.suffixIcon,
    this.helpText,
    this.inputType,
    this.fillColor,
    this.margin,
    this.textColor,
    this.capitalization = TextCapitalization.none,
    this.enable = true,
    this.lessLeftMargin = false,
    this.lessRightMargin = false,
    this.controller,
    this.validator,
    this.formatter,
    this.focusNode,
    this.hint,
    this.noTopMargin = false,
    this.autoFocus = false,
    this.required = false,
    this.error,
    this.suffixWidget,
    this.minLines,
    this.maxLines,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: lessLeftMargin ? 5 : 15,
          right: lessRightMargin ? 5 : 15,
          top: noTopMargin ? 0 : 5,
          bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          label == null
              ? SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(left: 2, top: 5, bottom: 3),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          label.toUpperCase(),
                          textScaleFactor: 0.9,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 11,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .color
                                .withOpacity(0.75),
                          ),
                        ),
                      ),
                      (required ?? false)
                          ? Text(
                              "*",
                              textScaleFactor: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.red,
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
          Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Theme.of(context).primaryColor,
            ),
            child: TextFormField(
              validator: validator,
              autofocus: autoFocus,
              minLines: minLines ?? 1,
              maxLines: maxLines ?? 1,
              onChanged: onChanged,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1,
                color: textColor,
              ),
              controller: controller,
              keyboardType: inputType,
              enabled: enable,
              inputFormatters: formatter,
              textCapitalization: capitalization,
              focusNode: focusNode,
              decoration: InputDecoration(
                filled: true,
                prefixIcon: prefixIcon,
                hintText: hint ?? label,
                helperText: helpText,
                errorText: error,
                prefix: prefix == null ? null : Icon(prefix),
                errorStyle: TextStyle(
                  color: Colors.red[300],
                ),
                helperStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.greenAccent,
                  fontSize: 14,
                ),
                helperMaxLines: 2,
                suffixIcon: suffixWidget == null
                    ? suffixIcon == null
                        ? null
                        : Icon(
                            suffixIcon,
                            color: textColor,
                          )
                    : suffixWidget,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
                  borderSide: BorderSide(
                    width: 0.5,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
                  borderSide: BorderSide(
                    width: 0.5,
                    color: Theme.of(context).errorColor,
                  ),
                ),
                fillColor: fillColor ?? Theme.of(context).backgroundColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
                  borderSide: BorderSide(
                    width: 0.5,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
                  borderSide: BorderSide(
                    width: 0.5,
                    color: Theme.of(context).buttonColor,
                  ),
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RCard extends StatelessWidget {
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color color;
  final Color shadowColor;
  final double elevation;
  final BorderRadius borderRadius;
  final Widget child;
  final BoxBorder border;

  const RCard(
      {Key key,
      this.margin,
      this.padding,
      this.color,
      this.elevation,
      this.borderRadius,
      @required this.child,
      this.border,
      this.shadowColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).canvasColor,
        boxShadow: [
          BoxShadow(
            color:
                shadowColor ?? Theme.of(context).dividerColor.withOpacity(0.75),
            blurRadius: elevation ?? 5,
          )
        ],
        border: border,
        borderRadius:
            borderRadius ?? BorderRadius.circular(AppConfig.kRadiusSmall),
      ),
      margin: margin ?? EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Material(
        color: color ?? Theme.of(context).canvasColor,
        borderRadius:
            borderRadius ?? BorderRadius.circular(AppConfig.kRadiusSmall),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          child: child,
          padding: padding ?? EdgeInsets.zero,
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final Brightness brightness;
  final double size;

  const Dot({Key key, this.brightness = Brightness.light, this.size = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(brightness: brightness),
      child: Container(
        width: size,
        height: size,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).dividerColor,
        ),
      ),
    );
  }
}

class SectioTitle extends StatelessWidget {
  final String text;

  const SectioTitle(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      width: double.maxFinite,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 7.5, bottom: 5),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ULText extends StatelessWidget {
  final String text;
  final Widget bullet;

  const ULText(this.text, {Key key, this.bullet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: text.length < 50
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          bullet ?? Text("»"),
          SizedBox(width: 7.5),
          Expanded(child: Text('$text')),
        ],
      ),
    );
  }
}

class LegendTile extends StatelessWidget {
  final String text;
  final Color color;

  const LegendTile(this.text, this.color, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Chip(
        label: Text(text),
        avatar: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
          ),
        ),
      ),
    );
  }
}

class BulletButton extends StatelessWidget {
  final String text;
  final Color color;
  final bool bordered;

  BulletButton(this.text, {this.color, this.bordered = false, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        side: bordered
            ? BorderSide(color: color ?? Theme.of(context).accentColor)
            : BorderSide.none,
        borderRadius: BorderRadius.circular(AppConfig.kRadiusSmallest),
      ),
      color: bordered
          ? Colors.transparent
          : color ?? Theme.of(context).accentColor,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          text.toUpperCase(),
          textScaleFactor: 0.8,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: bordered
                ? color ?? Theme.of(context).accentColor
                : Colors.white,
          ),
        ),
      ),
    );
  }
}

class LabelValueHolder extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const LabelValueHolder(this.label, this.value, {Key key, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        children: [
          Icon(icon ?? FluentSystemIcons.ic_fluent_arrow_right_circle_regular),
          SizedBox(width: 7.5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

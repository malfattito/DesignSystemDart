import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkedLabel extends StatefulWidget {
  final String text;
  final String linkText;
  final String url;
  final Function(bool?)? onChanged;
  final bool initialValue;

  const LinkedLabel({
    Key? key,
    required this.text,
    required this.linkText,
    required this.url,
    this.onChanged,
    this.initialValue = false,
  }) : super(key: key);

  @override
  _LinkedLabelState createState() => _LinkedLabelState();
}

class _LinkedLabelState extends State<LinkedLabel> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  void _launchURL() async {
    if (await canLaunch(widget.url)) {
      await launch(widget.url);
    } else {
      throw 'Could not launch ${widget.url}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
        ),
        RichText(
          text: TextSpan(
            text: widget.text,
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: widget.linkText,
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()..onTap = _launchURL,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
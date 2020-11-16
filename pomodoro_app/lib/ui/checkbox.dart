// My Customized Checkbox.
import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  MyCheckbox({Key key}) : super(key: key);

  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Checkbox(
        value: isChecked,
        onChanged: (value) {
          _toggleCheckbox(value);
        },
        activeColor: Colors.green,
        checkColor: Colors.white,
      ),
    );
  }

  void _toggleCheckbox(bool value) {
    if (isChecked == false) {
      setState(() {
        isChecked = true;
      });
    } else {
      setState(() {
        isChecked = false;
      });
    }
  }
}

import 'package:flutter/material.dart';

// defaultButton
Widget customButton({
  double width = double.infinity,
  Color background = Colors.red,
  required Function() function,
  required Widget widget,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: background,
      ),
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: widget,
      ),
    );



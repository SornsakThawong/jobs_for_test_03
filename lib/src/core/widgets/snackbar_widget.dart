import 'package:flutter/material.dart';

class SnackBarWidget {
  static final instance = SnackBarWidget();

  show(BuildContext context, {required String title, Color? backgroundColor}) {
    backgroundColor = backgroundColor ?? Colors.grey;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }

  close(BuildContext context) => ScaffoldMessenger.of(context).clearSnackBars();
}

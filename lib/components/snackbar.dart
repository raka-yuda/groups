import 'package:flutter/material.dart';

class SnackBarCustom extends StatelessWidget {
  final String message;

  SnackBarCustom({this.message});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      backgroundColor: Color(0xFF2F4858),
      action: SnackBarAction(
        label: 'Action',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
      content: Text(message),
      duration: Duration(milliseconds: 1500),
      width: 280.0,
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}

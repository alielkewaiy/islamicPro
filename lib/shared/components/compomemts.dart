import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String message, required ToastStates states}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: choseToastColor(states),
        textColor: Colors.white,
        fontSize: 25.0);

enum ToastStates { SUCCESS, ERROR, WARING }
Color choseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARING:
      color = Colors.amber;
      break;
  }

  return color;
}

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

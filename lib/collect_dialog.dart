import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

 showDialogNotify(String content) {
  Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,

      fontSize: 16.0

  );
}
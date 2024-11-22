import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({required String message}) {
  return Fluttertoast.showToast(
      msg:message ,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 20,
      backgroundColor: Colors.grey.shade600,
      textColor: Colors.black,
      fontSize: 16.sp);
}
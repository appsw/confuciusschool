import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
class ToastUtil{
  static void makeToast(String text){
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        textColor:Colors.black54,
        backgroundColor: ColorsUtil.ToastBG);
  }
}
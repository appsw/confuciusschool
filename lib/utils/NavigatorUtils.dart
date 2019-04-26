import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigatorUtils{

  static Future<T> pushAndRemoveUntil<T extends Object>(BuildContext context,Widget widget){
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => widget),(route) => route == null);
  }

  static Future<T> push<T extends Object>(BuildContext context, Widget widget){
    Navigator.push(context, new MaterialPageRoute(
        builder: (context) => widget
    ));
  }
}
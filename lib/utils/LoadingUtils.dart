import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingUtils{
  static Widget getRingLoading(){
    return Container(
      child: SpinKitRing(
        color: Colors.red,
//        itemBuilder: (_, int index) {
//          return DecoratedBox(
//            decoration: BoxDecoration(
//              color: Colors.black
//            ),
//          );
//        },
      ),
    );
  }
}
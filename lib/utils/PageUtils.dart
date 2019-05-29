import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageUtils{
  static Widget getBackWidge(BuildContext context){
    return GestureDetector(
      child: Container(
        width: 30.0,
        height: 30.0,
        alignment: Alignment.center,
        color: Colors.transparent,
        child: Image.asset("images/all_back.png",height: 18.0,width: 10.0,fit: BoxFit.fill,),
      ),
      onTap: (){
        Navigator.pop(context);
      },
    );
  }
  static AppBar getAppBar(BuildContext context,String name){
    return AppBar(
      title: Text(name,
        style: TextStyle(
            color: Colors.black
        ),),
      centerTitle: true,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      leading: PageUtils.getBackWidge(context),
      elevation: 1.0,
    );
  }
}
import 'package:flutter/widgets.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';

class LinsUtils{
  static Widget getHeightLins(BuildContext context,{Color color,var width,var height}){
    return Container(
      color:  color == null ? ColorsUtil.linesBG : color,
      width:  width == null ? 1.0 : width,
      height: height == null ? MediaQuery.of(context).size.height : height,
    );
  }

  static Widget getWidthLins(BuildContext context,{Color color,var width,var height}){
    return Container(
      color:  color == null ? ColorsUtil.linesBG : color,
      width: width == null ? MediaQuery.of(context).size.width : width,
      height: height == null ? 1.0 : height,
    );
  }
}
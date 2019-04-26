import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:flutter/widgets.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';

class RepayPage extends BasefulWidget{

  int _titleIndex = 0;
  List names = ["全部","已还清","未还清"];

  Widget getHead(){
    return Container(
      margin: EdgeInsets.only(top: 15.0,left: 13.0,right: 13.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: getHeadItem(0),
          ),
          Expanded(
            flex: 1,
            child: getHeadItem(1),
          ),
          Expanded(
            flex: 1,
            child: getHeadItem(2),
          ),
        ],
      ),
    );
  }
  Widget getHeadItem(int index){
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        height: 40.0,
//        color: _titleIndex == index ? Colors.white : ColorsUtil.SeekBarColor,
        child: Text(names[index],
          style: TextStyle(
              fontSize: DefaultValue.loginBtnSize,
              color: _titleIndex == index ? ColorsUtil.SeekBarColor : Colors.white
          ),),
          decoration: new BoxDecoration(
              color: _titleIndex == index ? Colors.white : ColorsUtil.SeekBarColor,
              borderRadius:  new BorderRadius.all(Radius.circular(4.0))
          )
      ),

      onTap: (){
        setState((){
          _titleIndex = index;
        });
      },
    );
  }

  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return null;
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      child: Column(
        children: <Widget>[
          getHead(),
        ],
      ),
    );
  }

}
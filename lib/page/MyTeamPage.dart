import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class MyTeamPage extends BasefulWidget{
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "我的团队");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 150.0,
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Image.asset("images/home04_3tuandui_tubiao.png",width: 100.0,height: 100.0,),
                Container(
                width: 100.0,height: 100.0,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20.0),
                  child: Text("总人数23",style:
                    TextStyle(
                      color: Colors.white,
                      fontSize: DefaultValue.textSize
                    ),),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: 78.0,
            margin: EdgeInsets.only(top: DefaultValue.topMargin),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("10",style:
                        TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                        Text("已用名额",style:
                        TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("200",style:
                        TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                        Text("未用名额",style:
                        TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: DefaultValue.topMargin),
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
            color: Colors.white,
            height: 54.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text("我的会员",style:
                  TextStyle(
                      color: Colors.black,
                      fontSize: DefaultValue.textSize
                  ),),
                ),
                Text("10",style:
                TextStyle(
                    color: Colors.black,
                    fontSize: DefaultValue.textSize
                ),),
              ],
            ),
          )
        ],
      ),
    );
  }

}
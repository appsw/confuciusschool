import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/page/AboutPage.dart';
import 'package:confuciusschool/page/ChangePhonePage.dart';
import 'package:confuciusschool/page/ChangePswdPage.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class SettingPage extends BasefulWidget{
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "设置");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              NavigatorUtils.push(context, AboutPage());
            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("关于我们",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: Image.asset("images/home04_5_1tixinadaoyinhangka_gengduo.png",width: 7.0,height: 12.0,),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){

            },
            child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
                      child: Row(
                      children: <Widget>[
                      Expanded(
                      flex: 1,
                      child: Text("允许在2G/3G/4G网络观看",
                      style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0
                      ),),
                      ),
                      Container(
                      margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                      child: Image.asset("images/home04_1shezhi_handle.png",width: 51.0,height: 31.0,),
                      ),
                      ],
                      ),
                      ),
          ),
          GestureDetector(
            onTap: (){

            },
            child: Container(
    color: Colors.white,
    padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
    child: Row(
    children: <Widget>[
    Expanded(
    flex: 1,
    child: Text("清除缓存",
    style: TextStyle(
    color: Colors.black,
    fontSize: 15.0
    ),),
    ),
    Container(
    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
    child: Text("4.98MB",
    style: TextStyle(
    color: Colors.black,
    fontSize: 15.0
    ),),
    ),
    Container(
    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
    child: Image.asset("images/home04_5_1tixinadaoyinhangka_gengduo.png",width: 7.0,height: 12.0,),
    ),
    ],
    ),
    ),
          ),
          GestureDetector(
            onTap: (){
              NavigatorUtils.push(context, ChangePswdPage());
            },
            child: Container(
    color: Colors.white,
    padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
    child: Row(
    children: <Widget>[
    Expanded(
    flex: 1,
    child: Text("修改密码",
    style: TextStyle(
    color: Colors.black,
    fontSize: 15.0
    ),),
    ),
    Container(
    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
    child: Image.asset("images/home04_5_1tixinadaoyinhangka_gengduo.png",width: 7.0,height: 12.0,),
    ),
    ],
    ),
    ),
          ),
          GestureDetector(
            onTap: (){
              NavigatorUtils.push(context, ChangePhonePage());
            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("更换手机",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: Image.asset("images/home04_5_1tixinadaoyinhangka_gengduo.png",width: 7.0,height: 12.0,),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){

            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("当前版本",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: Text("1.0",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: Image.asset("images/home04_5_1tixinadaoyinhangka_gengduo.png",width: 7.0,height: 12.0,),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){

            },
            child: Container(
              margin: EdgeInsets.only(top: 100.0),
              child: FlatButton(
                onPressed: (){
                  print('点击3333333333333333333333333333333333333333333333333333333333333333333333333333333');
                },
                color: ColorsUtil.LogoutBtnBg,//按钮的背景颜色
                padding: EdgeInsets.only(top:13.0,bottom: 14.0,left: 146.0,right: 146.0),//按钮距离里面内容的内边距
                child: new Text('退出登录',style: TextStyle(fontSize: DefaultValue.loginBtnSize),),
                textColor: Colors.white,//文字的颜色
                textTheme:ButtonTextTheme.normal ,//按钮的主题
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

}
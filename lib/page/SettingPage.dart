import 'dart:async';

import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/dialog/LoadingDialog.dart';
import 'package:confuciusschool/page/AboutPage.dart';
import 'package:confuciusschool/page/ChangePayPswdPage.dart';
import 'package:confuciusschool/page/ChangePhonePage.dart';
import 'package:confuciusschool/page/ChangePswdPage.dart';
import 'package:confuciusschool/page/LoginPage.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/Constant.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/SharedPreferencesUtil.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class SettingPage extends BasefulWidget{

  Timer _timer;
  var Size = 12;
  bool is4G = false;
  var code = "1.0";
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "设置");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    api.getSettingData((code){
      setState((){
        this.code = code;
      });
    }, (msg){
      ToastUtil.makeToast(msg);
    });
    SharedPreferencesUtil.getString(Constant.ISAUTOPLAY).then((String data){
      print(data);
      if(data == "1"){
        setState((){
          is4G = true;
        });
      }else{
        setState((){
          is4G = false;
        });
      }
    });
  }

  void Clean(){
    LoadingDialog.showLoadingDialog(context);
    _timer = new Timer.periodic(const Duration(seconds: 2), (timer){
      LoadingDialog.dismissLoadingDialog(context);
      setState(() {
        Size = 0;
        stopTime();
      });
    });
  }
  void stopTime() {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = null;
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
              var aotuplay = "0";
              if(is4G){
                aotuplay = "1";
              }
              print(aotuplay);
              SharedPreferencesUtil.saveString(Constant.ISAUTOPLAY,aotuplay,(bool result){
                setState((){
                  is4G = !is4G;
                });
              });
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
                      child: Image.asset(is4G ? "images/close.png" : "images/home04_1shezhi_handle.png",width: 51.0,height: 31.0,),
                      ),
                      ],
                      ),
                      ),
          ),
          GestureDetector(
            onTap: (){
              Clean();
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
    child: Text("${Size}MB",
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
              NavigatorUtils.push(context, ChangePayPswdPage());
            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("修改提现密码",
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
                    child: Text("${code}",
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
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 100.0,left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
              child: FlatButton(
                onPressed: (){
                  LogOut();
                },
                color: ColorsUtil.LogoutBtnBg,//按钮的背景颜色
                padding: EdgeInsets.only(top:13.0,bottom: 14.0,),//按钮距离里面内容的内边距
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: new Text('退出登录',
                    maxLines: 1,
                    style: TextStyle(fontSize: DefaultValue.loginBtnSize),),),
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
  void LogOut(){
    SharedPreferencesUtil.saveString(Constant.ISLOGIN,"2",(bool result){
      if(result){
        NavigatorUtils.pushAndRemoveUntil(context, new LoginPage());
      }
    });
//    SharedPreferencesUtil.clearAll().then((s){
//      if (s){
//        Navigator.pushAndRemoveUntil(
//            context,
//            MaterialPageRoute(
//                builder: (context) => LoginPage()),(route) => route == null);
//      }
//    });
  }

}
import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/page/VerificationPhonePage.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
class ChangePhonePage extends StatefulWidget {
  @override
  _ChangePhonePageState createState() => _ChangePhonePageState();
}

class _ChangePhonePageState extends BaseState {
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "更换绑定手机");
  }
  var phonrNumber = "133****1234";
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    api.getPhone((phone){
      setState((){
        this.phonrNumber = phone;
      });
    }, (msg){
      ToastUtil.makeToast(msg);
    });
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 31.0,left: 31.0),
            child: Image.asset("images/home04_1_3genghuanshouji_tubiao.png",width: 177.0,height: 214.0,),
          ),
          Container(
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 20.0,bottom: 20.0),
            margin: EdgeInsets.only(top: 28.0),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("当前绑定的手机号：",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: DefaultValue.loginBtnSize
                  ),),
                Text("${phonrNumber}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: DefaultValue.loginBtnSize
                  ),),
              ],
            ),
          ),
          getBtn()
        ],
      ),
    );
  }
  Widget getBtn(){
    return Container(
      margin: EdgeInsets.only(top: 120.0),
      child: FlatButton(
        onPressed: (){
          NavigatorUtils.push(context, VerificationPhonePage());
          print('点击3333333333333333333333333333333333333333333333333333333333333333333333333333333');
        },
        color: ColorsUtil.LogoutBtnBg,//按钮的背景颜色
        padding: EdgeInsets.only(top:13.0,bottom: 14.0,left: 100.0,right: 100.0),//按钮距离里面内容的内边距
        child: new Text('更换绑定手机号',style: TextStyle(fontSize: DefaultValue.loginBtnSize),),
        textColor: Colors.white,//文字的颜色
        textTheme:ButtonTextTheme.normal ,//按钮的主题
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}
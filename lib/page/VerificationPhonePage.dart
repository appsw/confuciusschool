import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class VerificationPhonePage extends BasefulWidget{
  var codeController = TextEditingController();
  var phoneController = TextEditingController();
  var phonrNumber = "133****1234";
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "验证手机号");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 20.0,bottom: 20.0),
            child: Column(
              children: <Widget>[
                Text("更换手机号后，下次登录可使用新手机号登录，当前手机号  $phonrNumber",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: DefaultValue.loginBtnSize
                  ),),
              ],
            ),
          ),
          getPhone(),
          getCode(),
          getBtn()
        ],
      ),
    );
  }
  Widget getBtn(){
    return Container(
      margin: EdgeInsets.only(top: 244.0),
      child: FlatButton(
        onPressed: (){
          String code = codeController.text;
          String phone = phoneController.text;
          if(code.isEmpty || phone.isEmpty){
            ToastUtil.makeToast("请完善内容！");
            return;
          }
          api.changePhone(code,phone,
                  (msg){
                ToastUtil.makeToast(msg);
              },
                  (msg){
                ToastUtil.makeToast(msg);
              }
          );
          print('点击3333333333333333333333333333333333333333333333333333333333333333333333333333333');
        },
        color: ColorsUtil.LogoutBtnBg,//按钮的背景颜色
        padding: EdgeInsets.only(top:13.0,bottom: 14.0,left: 146.0,right: 146.0),//按钮距离里面内容的内边距
        child: new Text('确定修改',style: TextStyle(fontSize: DefaultValue.loginBtnSize),),
        textColor: Colors.white,//文字的颜色
        textTheme:ButtonTextTheme.normal ,//按钮的主题
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
  Widget getCode(){
    return Container(
      height: 54.0,
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 11.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TextField(
              controller: codeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(2.0),
                border: InputBorder.none,
                hintText: '填写验证码',
                prefixStyle: new TextStyle(height: 20.0),
                hintStyle: new TextStyle(color: Colors.grey,fontSize: DefaultValue.messageTextSize),
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: getCodeBtn(),
          )
        ],
      ),
      padding:const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0) ,
    );
  }
  Widget getPhone(){
    return Container(
      height: 54.0,
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(2.0),
                border: InputBorder.none,
                hintText: '请输入新手机号',
                prefixStyle: new TextStyle(height: 20.0),
                hintStyle: new TextStyle(color: Colors.grey,fontSize: DefaultValue.messageTextSize),
              ),
            ),
          ),

        ],
      ),
      padding:const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0) ,
    );
  }
  Widget getCodeBtn(){
    return Container(
//      margin: EdgeInsets.only(top: 20.0),
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: (){
          var phone = phoneController.text;
          if(phone.isEmpty){
            ToastUtil.makeToast("请先输入手机号");
            return;
          }

          api.changePhoneGetSMS(phone,
                  (msg){
                ToastUtil.makeToast(msg);
              },
                  (msg){
                ToastUtil.makeToast(msg);
              }
          );
          print('点击3333333333333333333333333333333333333333333333333333333333333333333333333333333');
        },
        color: ColorsUtil.LogBtnBg,//按钮的背景颜色
        padding: EdgeInsets.only(top:8.0,bottom: 8.0,left: 13.0,right: 13.0),//按钮距离里面内容的内边距
        child: new Text('获取验证码',style: TextStyle(fontSize: DefaultValue.smallTextSize),),
        textColor: Colors.white,//文字的颜色
        textTheme:ButtonTextTheme.normal ,//按钮的主题
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    api.getPhone((phone){
      setState((){
        this.phonrNumber = phone;
      });
    }, (msg){
      ToastUtil.makeToast(msg);
    });
  }

}
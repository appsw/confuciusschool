import 'package:confuciusschool/page/RegistAgreementPage.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';

class RegisterPage extends BasefulWidget{

  var phoneController = TextEditingController();
  var nickController = TextEditingController();
  var pswdController = TextEditingController();
  var repswdController = TextEditingController();
  var codeController = TextEditingController();
  var recommenController = TextEditingController();

  Widget getBody(BuildContext context){
//    asd
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(bottom: DefaultValue.bottomMargin),
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/01_denglu_bj.png"),
              //这里是从assets静态文件中获取的，也可以new NetworkImage(）从网络上获取
//                centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              getLoginText(),
              getHeadImg(),
              getPhone(),
//              getNickname(),
              getPswd(),
//              getRePswd(),
              getCode(),
              getRecommen(),
              getLoginBtn(),
              getAgreement()
            ],
          ),
        ),
      ),
    );
  }
  Widget getLoginText(){
    return GestureDetector(
      child: Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(top: 72.0,right: 45.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("返回登录",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: DefaultValue.textSize
                ),),
            ],
          )
      ),
      onTap: (){
        Navigator.pop(context);
      },
    );
  }
  Widget getHeadImg(){
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Image.asset("images/01_denglu_logo.png",width: 161.0,height: 101.0,),
    );
  }
  Widget getPhone(){
    return Container(
      height: 47.0,
      width: 305.0,
      margin: EdgeInsets.only(top: 93.0),
      child: TextField(
        controller: phoneController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(2.0),
          border: InputBorder.none,
          hintText: '请输入手机号',
          prefixStyle: new TextStyle(height: 20.0),
          hintStyle: new TextStyle(color: ColorsUtil.LogEditBg,fontSize: DefaultValue.messageTextSize),
        ),
      ),
      padding:const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0) ,
      decoration: new BoxDecoration(
          border: new Border.all(width: 1.0,color:ColorsUtil.LogEditBg ),
          color: Colors.white,
          borderRadius:  new BorderRadius.all(Radius.circular(20.0))
      ),
    );
  }
  Widget getNickname(){
    return Container(
      height: 47.0,
      width: 305.0,
      margin: EdgeInsets.only(top: 20.0),
      child: TextField(
        controller: nickController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(2.0),
          border: InputBorder.none,
          hintText: '请输入昵称',
          prefixStyle: new TextStyle(height: 20.0),
          hintStyle: new TextStyle(color: ColorsUtil.LogEditBg,fontSize: DefaultValue.messageTextSize),
        ),
      ),
      padding:const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0) ,
      decoration: new BoxDecoration(
          border: new Border.all(width: 1.0,color:ColorsUtil.LogEditBg ),
          color: Colors.white,
          borderRadius:  new BorderRadius.all(Radius.circular(20.0))
      ),
    );
  }
  Widget getPswd(){
    return Container(
      height: 47.0,
      width: 305.0,
      margin: EdgeInsets.only(top: 20.0),
      child: TextField(
        controller: pswdController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(2.0),
          border: InputBorder.none,
          hintText: '请输入登录密码',
          prefixStyle: new TextStyle(height: 20.0),
          hintStyle: new TextStyle(color: ColorsUtil.LogEditBg,fontSize: DefaultValue.messageTextSize),
        ),
      ),
      padding:const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0) ,
      decoration: new BoxDecoration(
          border: new Border.all(width: 1.0,color:ColorsUtil.LogEditBg ),
          color: Colors.white,
          borderRadius:  new BorderRadius.all(Radius.circular(20.0))
      ),
    );
  }
  Widget getRePswd(){
    return Container(
      height: 47.0,
      width: 305.0,
      margin: EdgeInsets.only(top: 20.0),
      child: TextField(
        controller: repswdController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(2.0),
          border: InputBorder.none,
          hintText: '请确认登录密码',
          prefixStyle: new TextStyle(height: 20.0),
          hintStyle: new TextStyle(color: Colors.white,fontSize: DefaultValue.messageTextSize),
        ),
      ),
      padding:const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0) ,
      decoration: new BoxDecoration(
          border: new Border.all(width: 1.0,color:Colors.white ),
          color: ColorsUtil.SeekBarColor,
          borderRadius:  new BorderRadius.all(Radius.circular(20.0))
      ),
    );
  }
  Widget getCode(){
    return Container(
      height: 47.0,
      width: 305.0,
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TextField(
              controller: codeController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(2.0),
                border: InputBorder.none,
                hintText: '请输入验证码',
                prefixStyle: new TextStyle(height: 20.0),
                hintStyle: new TextStyle(color: ColorsUtil.LogEditBg,fontSize: DefaultValue.messageTextSize),
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
      decoration: new BoxDecoration(
          border: new Border.all(width: 1.0,color:ColorsUtil.LogEditBg ),
          color: Colors.white,
          borderRadius:  new BorderRadius.all(Radius.circular(20.0))
      ),
    );
  }
  Widget getRecommen(){
    return Container(
      height: 47.0,
      width: 305.0,
      margin: EdgeInsets.only(top: 20.0),
      child: TextField(
        controller: recommenController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(2.0),
          border: InputBorder.none,
          hintText: '推荐人推广码(选填)',
          prefixStyle: new TextStyle(height: 20.0),
          hintStyle: new TextStyle(color: ColorsUtil.LogEditBg,fontSize: DefaultValue.messageTextSize),
        ),
      ),
      padding:const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0) ,
      decoration: new BoxDecoration(
          border: new Border.all(width: 1.0,color:ColorsUtil.LogEditBg ),
          color: Colors.white,
          borderRadius:  new BorderRadius.all(Radius.circular(20.0))
      ),
    );
  }
  Widget getAgreement(){
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 30.0,left: 45.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Text("注册表示您已同意",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: DefaultValue.textSize
                ),),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("用户服务协议及隐私政策",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: DefaultValue.textSize
                  ),),
                LinsUtils.getWidthLins(context,width: 130.0,color: Colors.grey),
              ],
            )

          ],
        ),
      ),
      onTap: (){
        NavigatorUtils.push(context, new RegistAgreementPage());
      },
    );
  }
  Widget getLoginBtn(){
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: FlatButton(
        onPressed: (){
          var phone = phoneController.text;

          var pswd= pswdController.text;

          var code = codeController.text;
          var recommen = recommenController.text;
          if(phone.isEmpty || pswd.isEmpty || code.isEmpty){
            ToastUtil.makeToast("请完善信息！");
            return;
          }
          api.Register(phone, pswd, code, recommen, (msg){
            ToastUtil.makeToast(msg);
            Navigator.pop(context);
          }, (msg){
            ToastUtil.makeToast(msg);
          });

          print('点击3333333333333333333333333333333333333333333333333333333333333333333333333333333');
        },
        color: ColorsUtil.LogBtnBg,//按钮的背景颜色
        padding: EdgeInsets.only(top:16.0,bottom: 16.0,left: 136.0,right: 136.0),//按钮距离里面内容的内边距
        child: new Text('注册',style: TextStyle(fontSize: DefaultValue.loginBtnSize),),
        textColor: Colors.white,//文字的颜色
        textTheme:ButtonTextTheme.normal ,//按钮的主题
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
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
          api.SendSms(phone,"1",(msg){
            ToastUtil.makeToast(msg);
          },(msg){
            ToastUtil.makeToast(msg);
          });
          print('点击3333333333333333333333333333333333333333333333333333333333333333333333333333333');
        },
        color: ColorsUtil.LogBtnBg,//按钮的背景颜色
        padding: EdgeInsets.only(top:4.0,bottom: 4.0,left: 13.0,right: 13.0),//按钮距离里面内容的内边距
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
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return null;
  }


}
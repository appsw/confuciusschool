import 'package:confuciusschool/page/BindWeChatPage.dart';
import 'package:confuciusschool/page/ForgetPswdPage.dart';
import 'package:confuciusschool/page/IndexPage.dart';
import 'package:confuciusschool/utils/Constant.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:confuciusschool/utils/SharedPreferencesUtil.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/page/RegisterPage.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:fluwx/fluwx.dart';
import 'ChangePswdPage.dart';

class CodeLoginPage extends BasefulWidget{
  var username = "";
  var pswd = "";
  var phoneController = TextEditingController();
  var pswdController = TextEditingController();
  var codeController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fluwx.register(appId:"wxcb2c326bb55e8abe");
    fluwx.responseFromAuth.listen((WeChatAuthResponse data) {
      print(data.code);
      api.weixinLogin(data.code, (msg){
        ToastUtil.makeToast(msg);
      }, (msg){
        ToastUtil.makeToast(msg);
        NavigatorUtils.push(context, new BindWeChatPage(data.code));
      });
    });
  }

  @override
  Widget getBody(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
//      color: ColorsUtil.whiteGrey,
      child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          //设置背景图片
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/01_denglu_bj.png"),
              //这里是从assets静态文件中获取的，也可以new NetworkImage(）从网络上获取
//                centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              getRegisterText(),
              getHeadImg(),
              getPhone(),
              getCode(),
              getLoginBtn(),
              getForgetPswdText(),
//              getAgreement(),
              getThreeText(),
              getThreeImg()
            ],
          ),
        ),
      ),
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
      margin: EdgeInsets.only(top: 57.0),
      child: TextField(
        controller: phoneController,
        keyboardType: TextInputType.number,
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
  Widget getPswd(){
    return Container(
      height: 47.0,
      width: 305.0,
      margin: EdgeInsets.only(top: 24.0),
      child: TextField(
        controller: pswdController,
        keyboardType: TextInputType.number,
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
  Widget getLoginBtn(){
    return Container(
      margin: EdgeInsets.only(top: 23.0),
      child: FlatButton(
        onPressed: (){
          var phone = phoneController.text;
          var code = codeController.text;
          if(phone.isEmpty || code.isEmpty){
            ToastUtil.makeToast("请输入手机号跟验证码！");
            return;
          }
          api.codeLogin(phone, code, (msg){
            ToastUtil.makeToast(msg);
            SharedPreferencesUtil.saveString(Constant.ISLOGIN,"1",(bool result){
              if(result){
                NavigatorUtils.pushAndRemoveUntil(context, new IndexPage());
              }
            });
          },(msg){
            ToastUtil.makeToast(msg);
          } );
          print('点击3333333333333333333333333333333333333333333333333333333333333333333333333333333');
        },
        color: ColorsUtil.LogBtnBg,//按钮的背景颜色
        padding: EdgeInsets.only(top:16.0,bottom: 16.0,left: 136.0,right: 136.0),//按钮距离里面内容的内边距
        child: new Text('登录',style: TextStyle(fontSize: DefaultValue.loginBtnSize),),
        textColor: Colors.white,//文字的颜色
        textTheme:ButtonTextTheme.normal ,//按钮的主题
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
  Widget getForgetPswdText(){
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: GestureDetector(
            child: Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 28.0,left: 45.0),
              child: Text("密码登录",
                style: TextStyle(
                    color: ColorsUtil.LogBtnBg,
                    fontSize: DefaultValue.textSize
                ),),
            ),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(child:
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 28.0,right: 45.0),
            child: Text("忘记密码",
              style: TextStyle(
                  color: ColorsUtil.LogBtnBg,
                  fontSize: DefaultValue.textSize
              ),),
          ),
            onTap: (){
              NavigatorUtils.push(context, new ForgetPswdPage());
            },),
        ),
      ],
    );
  }
  Widget getRegisterText(){
    return GestureDetector(
      child: Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(top: 72.0,right: 45.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("还没有账号？",
                style: TextStyle(
                    color: ColorsUtil.LogEditBg,
                    fontSize: DefaultValue.textSize
                ),),Text("去注册",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: DefaultValue.textSize
                ),),
            ],
          )
      ),
      onTap: (){
        NavigatorUtils.push(context, new RegisterPage());
      },
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
            Image.asset("images/01_1denglu_dui.png",width: 15.0,height: 15.0,),
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Text("我已阅读并同意“用户协议”和“隐私协议”",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: DefaultValue.textSize
                ),),
            )

          ],
        ),
      ),
      onTap: (){
//        NavigatorUtils.push(context, new RegisterPage());
      },
    );
  }
  Widget getThreeText(){
    return Container(
      margin: EdgeInsets.only(top: 60.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LinsUtils.getWidthLins(context,color: ColorsUtil.LogEditBg,width: 92.0),
          Container(
            margin: EdgeInsets.only(left: 10.0,right: 10.0),
            child: Text("第三方账号登录",
              style: TextStyle(
                  color: ColorsUtil.LogEditBg,
                  fontSize: DefaultValue.textSize
              ),),
          ),
          LinsUtils.getWidthLins(context,color: ColorsUtil.LogEditBg,width: 92.0),
        ],
      ),
    );
  }
  Widget getThreeImg(){
    return GestureDetector(
      onTap: (){
        fluwx
            .sendAuth(
            scope: "snsapi_userinfo", state: "wechat_sdk_demo_test")
            .then((data) {
          print(data);
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 28.0,bottom: 28.0),
        child: Image.asset("images/01_1denglu_weixin.png"),
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
              keyboardType: TextInputType.number,
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
          api.SendSms(phone,"2",(msg){
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
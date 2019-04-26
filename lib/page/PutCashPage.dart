import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class PutCashPage extends BasefulWidget{

  var cashController = TextEditingController();
  var pswdController = TextEditingController();
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "提现到银行卡");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 20.0,bottom: 20.0),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Image.asset("images/home04_5_1tixinadaoyinhangka_tubiao.png",width: 30.0,height: 30.0,),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: DefaultValue.bottomMargin),
                          child: Text("招商银行",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: DefaultValue.loginBtnSize
                            ),),
                        ),
                        Container(
                          child: Text("尾号7554储蓄卡",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: DefaultValue.smallTextSize
                            ),),
                        )
                      ],
                    ),
                  ),
                ),
                Image.asset("images/home04_5_1tixinadaoyinhangka_gengduo.png",width: 15.0,height: 9.0,),
              ],
            ),
          ),
          LinsUtils.getWidthLins(context),
          Container(
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 20.0,bottom: 20.0),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Text("提现金额",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: DefaultValue.loginBtnSize
                  ),),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: TextField(
                      controller: cashController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(2.0),
                        border: InputBorder.none,
                        prefixStyle: new TextStyle(height: 20.0),
                        hintStyle: new TextStyle(color: ColorsUtil.LogEditBg,fontSize: DefaultValue.messageTextSize),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          LinsUtils.getWidthLins(context),
          Container(
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 20.0,bottom: 20.0),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Text("支付密码",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: DefaultValue.loginBtnSize
                  ),),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: TextField(
                      controller: pswdController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(2.0),
                        border: InputBorder.none,
                        prefixStyle: new TextStyle(height: 20.0),
                        hintStyle: new TextStyle(color: ColorsUtil.LogEditBg,fontSize: DefaultValue.messageTextSize),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          LinsUtils.getWidthLins(context),
          Container(
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 20.0,bottom: 20.0),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Text("剩余余额：￥256.00，",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: DefaultValue.textSize
                  ),),
                GestureDetector(
                  onTap: (){
                    setState((){
                      cashController.text = "256.0";
                    });
                  },
                  child: Text("全部提现",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: DefaultValue.textSize
                    ),),
                ),
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
      margin: EdgeInsets.only(top: 140.0),
      child: FlatButton(
        onPressed: (){
          print('点击3333333333333333333333333333333333333333333333333333333333333333333333333333333');
        },
        color: ColorsUtil.LogoutBtnBg,//按钮的背景颜色
        padding: EdgeInsets.only(top:13.0,bottom: 14.0,left: 146.0,right: 146.0),//按钮距离里面内容的内边距
        child: new Text('提现',style: TextStyle(fontSize: DefaultValue.loginBtnSize),),
        textColor: Colors.white,//文字的颜色
        textTheme:ButtonTextTheme.normal ,//按钮的主题
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }

}
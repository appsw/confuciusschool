import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';

class LoanPage extends BasefulWidget{

  List names = ["手机号","收款账号","银行卡号","所属银行","所属支行","银行预留手机号"];
  var phoneController = TextEditingController();
  var accountController = TextEditingController();
  var cardIdController = TextEditingController();
  var banknameController = TextEditingController();
  var branchnameController = TextEditingController();
  var bankphoneController = TextEditingController();
  var purposeController = TextEditingController();
  List<TextEditingController> controllers = [];



  Widget getTop(){
    return Container(
      margin: EdgeInsets.only(left: 13.0,right: 13.0,top: 15.0),
      padding: EdgeInsets.only(left: 11.0,right: 13.0),
      decoration: new BoxDecoration(
          color:Colors.white,
          borderRadius:  new BorderRadius.all(Radius.circular(4.0)),
          boxShadow:  <BoxShadow>[//设置阴影
            new BoxShadow(
              color: Colors.grey,//阴影颜色
              blurRadius: 6.0,//阴影大小
            ),
          ]
      ),
      child: Column(
        children: <Widget>[
          getTitle(0),
          LinsUtils.getWidthLins(context),
          getTitle(1),
          LinsUtils.getWidthLins(context),
          getTitle(2),
          LinsUtils.getWidthLins(context),
          getTitle(3),
          LinsUtils.getWidthLins(context),
          getTitle(4),
          LinsUtils.getWidthLins(context),
          getTitle(5),
        ],
      ),
    );
  }
  Widget getBottom(){
    return Container(
      height: 110.0,
      margin: EdgeInsets.only(left: 13.0,right: 13.0,top: 15.0),
      padding: EdgeInsets.only(left: 11.0,right: 13.0),
      decoration: new BoxDecoration(
          color:Colors.white,
          borderRadius:  new BorderRadius.all(Radius.circular(4.0)),
          boxShadow:  <BoxShadow>[//设置阴影
            new BoxShadow(
              color: Colors.grey,//阴影颜色
              blurRadius: 6.0,//阴影大小
            ),
          ]
      ),
      child: TextField(
        controller: purposeController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(2.0),
          border: InputBorder.none,
          hintText: '输入借款用途',
          hintStyle: new TextStyle(color: Colors.black,fontSize: DefaultValue.textSize),
        ),
      ),
    );
  }
  Widget getTitle(int index){
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Text(names[index],
            style: TextStyle(
              color: Colors.black,
              fontSize: DefaultValue.textSize
            ),),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              child: TextField(
                textAlign: TextAlign.right,
                controller: controllers[index],
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(2.0),
                  border: InputBorder.none,
                  hintText: '请填写',
                  hintStyle: new TextStyle(color: Colors.grey,fontSize: DefaultValue.textSize),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget getBoorowBtn(){
    return Container(
      margin: EdgeInsets.only(top: 60.0,bottom: 26.0),
      child: FlatButton(
        onPressed: (){
          Navigator.pop(context);
        },
        color: ColorsUtil.SeekBarColor,//按钮的背景颜色
        padding: EdgeInsets.only(top:12.0,bottom: 13.0,left: 145.0,right: 145.0),//按钮距离里面内容的内边距
        child: new Text('我要借款'),
        textColor: Colors.white,//文字的颜色
        textTheme:ButtonTextTheme.normal ,//按钮的主题
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );
  }

  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return AppBar(
      title: Text("借款",
        style: TextStyle(
            color: Colors.black
        ),),
      centerTitle: true,
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      leading: PageUtils.getBackWidge(context),
      elevation: 0.0,
    );
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            getTop(),
            getBottom(),
            getBoorowBtn()
          ],
        ),
      ),
    );
  }
  @override
  void onCreate(BuildContext context) {
    // TODO: implement onCreate
    super.onCreate(context);
    controllers.add(phoneController);
    controllers.add(accountController);
    controllers.add(cardIdController);
    controllers.add(banknameController);
    controllers.add(branchnameController);
    controllers.add(bankphoneController);
  }
  
}
import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/model/AccountInfo.dart';
import 'package:confuciusschool/page/AddBankPage.dart';
import 'package:confuciusschool/page/IncomePage.dart';
import 'package:confuciusschool/page/PutCashPage.dart';
import 'package:confuciusschool/page/PutCashRecordPage.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends BaseState {

  AccountInfo data;
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    api.getAccount((AccountInfo data){
      setState(() {
        this.data = data;
      });
    }, (msg){
      ToastUtil.makeToast(msg);
    });
  }

  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return AppBar(
      title: Text("账户",
        style: TextStyle(
            color: Colors.white
        ),),
      centerTitle: true,
      brightness: Brightness.light,
      backgroundColor: ColorsUtil.AccountHeadBg,
      leading: PageUtils.getBackWidge(context),
      elevation: 0.0,
    );
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return data == null ? LoadingUtils.getRingLoading() : Container(
      child: Column(
        children: <Widget>[
          getHead(),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 20.0,bottom: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text("季度销售名额",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: DefaultValue.loginBtnSize
                    ),),
                ),
                Expanded(
                  flex: 0,
                  child: Text(data.arr.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: DefaultValue.loginBtnSize
                    ),),
                )
              ],
            ),
          ),
          LinsUtils.getWidthLins(context),
          GestureDetector(
            onTap: (){
              NavigatorUtils.push(context, PutCashPage());
            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 20.0,bottom: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("提现到银行卡",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.loginBtnSize
                      ),),
                  ),
                  Expanded(
                    flex: 0,
                    child: Image.asset("images/home04_5_1tixinadaoyinhangka_gengduo.png",width: 7.0,height: 12.0,),
                  )
                ],
              ),
            ),
          ),
          LinsUtils.getWidthLins(context),
          GestureDetector(
            onTap: (){
              NavigatorUtils.push(context, AddBankPage());
            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 20.0,bottom: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("绑定银行卡",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.loginBtnSize
                      ),),
                  ),
                  Expanded(
                    flex: 0,
                    child: Image.asset("images/home04_5_1tixinadaoyinhangka_gengduo.png",width: 7.0,height: 12.0,),
                  )
                ],
              ),
            ),
          ),
          LinsUtils.getWidthLins(context),
          GestureDetector(
            onTap: (){
              NavigatorUtils.push(context, IncomePage());
            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 20.0,bottom: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("收入明细",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.loginBtnSize
                      ),),
                  ),
                  Expanded(
                    flex: 0,
                    child: Image.asset("images/home04_5_1tixinadaoyinhangka_gengduo.png",width: 7.0,height: 12.0,),
                  )
                ],
              ),
            ),
          ),
          LinsUtils.getWidthLins(context),
          GestureDetector(
            onTap: (){
              NavigatorUtils.push(context, PutCashRecordPage());
            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 20.0,bottom: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("提现记录",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.loginBtnSize
                      ),),
                  ),
                  Expanded(
                    flex: 0,
                    child: Image.asset("images/home04_5_1tixinadaoyinhangka_gengduo.png",width: 7.0,height: 12.0,),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
  Widget getHead(){
    return Container(
      color: ColorsUtil.AccountHeadBg,
      width: MediaQuery.of(context).size.width,
      height: 140.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("账户余额",
            style: TextStyle(
                color: Colors.white,
                fontSize: DefaultValue.smallTextSize
            ),),
          Container(
            margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
            child: Text(data.ar.balance,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 41.0
              ),),
          ),
          Text("累计总收入：${data.ar.gross}",
            style: TextStyle(
                color: Colors.white,
                fontSize: DefaultValue.smallTextSize
            ),)
        ],
      ),
    );
  }
}
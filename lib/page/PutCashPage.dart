import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/dialog/ChosePutCashBankDialog.dart';
import 'package:confuciusschool/model/PutCashDataInfo.dart';
import 'package:confuciusschool/page/AddBankPage.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
class PutCashPage extends StatefulWidget {
  @override
  _PutCashPageState createState() => _PutCashPageState();
}

class _PutCashPageState extends BaseState {
  var cashController = TextEditingController();
  var pswdController = TextEditingController();
  PutCashDataInfo data;
  Bank bank;
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    getData();
  }
  void AddBank () async {
    var result = await Navigator.of(context).push(new MaterialPageRoute(builder: (context){return new AddBankPage();}));
    getData();
  }
  void getData(){
    api.getPutCashData((PutCashDataInfo data){
      setState((){
        this.data = data;
        if(data.bank.length != 0){
          bank = data.bank[0];
        }
      });
    }, (msg){
      ToastUtil.makeToast(msg);
      AddBank();
    });
  }
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "提现到银行卡");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return data == null ? LoadingUtils.getRingLoading() : Container(
      child: Column(
        children: <Widget>[
          data.bank.length == 0 ?
          Container(
            height: 60.0,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Text("请先添加银行卡"),
          ) :
          GestureDetector(
            onTap: (){
              ChosePutCashBankDialog.showBottomDialog(context, data.bank, (bank){
                setState((){
                  this.bank = bank;
                });
              },(){
                AddBank();
              });
            },
            child: Container(
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 20.0,bottom: 20.0),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Image.network(bank.img,width: 30.0,height: 30.0,),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: DefaultValue.bottomMargin),
                            child: Text("${bank.bankName}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: DefaultValue.loginBtnSize
                              ),),
                          ),
                          Container(
                            child: Text("尾号${bank.banknum}储蓄卡",
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
                Text("提现密码",
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
                      obscureText: true,
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
                Text("剩余余额：￥${data.mem.balance}",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: DefaultValue.textSize
                  ),),
                GestureDetector(
                  onTap: (){
                    setState((){
                      cashController.text = "${data.mem.balance}";
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
          getBtn(),
          Container(
            margin: EdgeInsets.only(top: DefaultValue.topMargin,left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
            child: Text("默认提现密码为123456,如果忘记提现密码请到 设置 - 更改提现密码 页面更改.",
            style: TextStyle(
              color: Colors.grey
            ),),
          )
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
          var cash = cashController.text;
          var pswd = pswdController.text;
          if(cash.isEmpty || pswd.isEmpty){
            ToastUtil.makeToast("请完善信息！");
            return;
          }
          api.putCash(cash, pswd, (msg){
            ToastUtil.makeToast(msg);
            Navigator.pop(context);
          }, (msg){
            ToastUtil.makeToast(msg);
          });
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
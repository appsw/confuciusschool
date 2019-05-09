import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/dialog/BankChoseDialog.dart';
import 'package:confuciusschool/model/BankInfo.dart';
import 'package:confuciusschool/page/VerificationPhoneAddBankPage.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class AddBankPage extends BasefulWidget{

  var nameController = TextEditingController();
  var banknameController = TextEditingController();
  var bankCardController = TextEditingController();
  bool isOther = false;
  List<BankInfo> data;
  var bankName = "选择银行";
  BankInfo chosebank;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    api.getBankList((data){
      setState((){
        this.data = data;
      });
    }, (){});
  }
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "添加银行卡");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 20.0,bottom: 20.0),
            child: Row(
              children: <Widget>[
                Text("请绑定持卡人本人的银行卡",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: DefaultValue.loginBtnSize
                  ),),
              ],
            ),
          ),
          LinsUtils.getWidthLins(context),
          Container(
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 20.0,bottom: 20.0),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Text("持卡人",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: DefaultValue.loginBtnSize
                  ),),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: TextField(
                      controller: nameController,
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
          GestureDetector(
            onTap: (){

              BankChoseDialog.showBottomDialog(context, data, (BankInfo bank){
                chosebank = bank;
                if(bank.bankId == 14){
                  setState((){
                    bankName = "其他银行";
                    isOther = true;
                  });
                }else{
                  setState((){
                    bankName = bank.bankName;
                    isOther = false;
                  });
                }
              });
            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 20.0,bottom: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("$bankName",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.loginBtnSize
                      ),),
                  ),
                  Expanded(
                    flex: 0,
                    child: isOther ? Image.asset("images/home04_6tuiguang_jiantou.png",width: 13.0,height: 8.0,) : Image.asset("images/home04_5_2_1tianjiayinhangka_xiala.png",width: 13.0,height: 8.0,),
                  )
                ],
              ),
            ),
          ),
          LinsUtils.getWidthLins(context),
          isOther ?
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 20.0,bottom: 20.0),
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Text("银行名称",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.loginBtnSize
                        ),),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                          child: TextField(
                            controller: banknameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              border: InputBorder.none,
                              hintText: '请手动输入银行名称',
                              prefixStyle: new TextStyle(height: 20.0),
                              hintStyle: new TextStyle(color: Colors.grey,fontSize: DefaultValue.messageTextSize),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                LinsUtils.getWidthLins(context),
              ],
            )
          :
              Container(),
          Container(
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 20.0,bottom: 20.0),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Text("卡号",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: DefaultValue.loginBtnSize
                  ),),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: TextField(
                      controller: bankCardController,
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
          addBank();
//            NavigatorUtils.push(context, VerificationPhoneAddBankPage());
          },
        color: ColorsUtil.LogoutBtnBg,//按钮的背景颜色
        padding: EdgeInsets.only(top:13.0,bottom: 14.0,left: 146.0,right: 146.0),//按钮距离里面内容的内边距
        child: new Text('确定添加',style: TextStyle(fontSize: DefaultValue.loginBtnSize),),
        textColor: Colors.white,//文字的颜色
        textTheme:ButtonTextTheme.normal ,//按钮的主题
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
  void addBank(){
    var name = nameController.text;
    var bankname = banknameController.text;
    var carnum = bankCardController.text;
    if(name.isEmpty || carnum.isEmpty){
      ToastUtil.makeToast("请完善信息！");
      return;
    }
    if(chosebank.bankName == "其他银行"){
      if(bankname .isEmpty){
        ToastUtil.makeToast("请完善信息！");
        return;
      }
      api.addBank(chosebank.bankId.toString(), bankname, name, carnum, (msg){
        ToastUtil.makeToast(msg);
        Navigator.pop(context);
      }, (msg){
        ToastUtil.makeToast(msg);
      });
    }else{
      api.addBank(chosebank.bankId.toString(), chosebank.bankName, name, carnum, (msg){
        ToastUtil.makeToast(msg);
        Navigator.pop(context);
      }, (msg){
        ToastUtil.makeToast(msg);
      });
    }

  }

}
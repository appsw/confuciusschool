import 'package:confuciusschool/model/PutCashDataInfo.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:flutter/material.dart';

class ChosePutCashBankDialog{
  static ScrollController controller = new ScrollController();
  static void showBottomDialog(BuildContext context,List<Bank> data,Function onChose,Function onAdd){
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return StatefulBuilder(builder: (context, state) {
        return SingleChildScrollView(
          controller: controller,
          child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                      height: 55.0,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 55.0,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child: Text("选择到账银行卡",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0
                              ),),
                          ),
                          Container(
                            height: 55.0,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(right: DefaultValue.rightMargin),
                            child: Image.asset("images/home04_2_1xiugaiziliaoxuanzediqu_quxiao.png",width: 16.0,height: 16.0,),
                          ),
                        ],
                      )
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      controller: controller,
                      itemBuilder: (context,index){
                        return getRow(context, data[index],onChose);
                      },
                      itemCount: data.length,
                      scrollDirection: Axis.vertical),
                  GestureDetector(
                    child: Container(
                      height: 55.0,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 50.0),
                      alignment: Alignment.centerLeft,
                      color: Colors.white,
                      child: Text("使用新卡提现",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: DefaultValue.titleTextSize
                      ),),
                    ),
                    onTap: (){
                      Navigator.pop(context);
                      onAdd();
                    },
                  )
                ],
              )
          )
        );
      });
    });
  }
  static Widget getRow(BuildContext context,Bank bank,Function onChose){
    return GestureDetector(
      child: Column(
        children: <Widget>[
          Container(
            height: 60.0,
            color: Colors.white,
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.network(bank.img,width: 30.0,height: 30.0,),
                Container(
                  margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(bank.bankName == null ? "${bank.bname}" : "${bank.bankName}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0
                        ),),
                      Text("尾号${bank.banknum}储蓄卡",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: DefaultValue.textSize
                        ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          LinsUtils.getWidthLins(context)
        ],
      ),
      onTap: (){
        onChose(bank);
        Navigator.pop(context);
      },
    );
  }
}
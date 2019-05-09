import 'package:confuciusschool/model/PutCashDataInfo.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:flutter/material.dart';

class ChosePutCashBankDialog{
  static void showBottomDialog(BuildContext context,List<Bank> data,Function onChose){
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return StatefulBuilder(builder: (context, state) {
        return Container(
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
                            fontSize: DefaultValue.titleTextSize
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
                  itemBuilder: (context,index){
                    return getRow(context, data[index],onChose);
                  },
                  itemCount: data.length,
                  scrollDirection: Axis.vertical),
            ],
          )
        );
      });
    });
  }
  static Widget getRow(BuildContext context,Bank bank,Function onChose){
    return GestureDetector(
      child: Container(
        height: 77.0,
        padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/home04_5_1tixinadaoyinhangka_tubiao.png",width: 30.0,height: 30.0,),
            Container(
              margin: EdgeInsets.only(left: DefaultValue.leftMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(bank.bankName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: DefaultValue.titleTextSize
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
      onTap: (){
        onChose(bank);
        Navigator.pop(context);
      },
    );
  }
}
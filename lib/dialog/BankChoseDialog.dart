import 'package:confuciusschool/model/BankInfo.dart';
import 'package:flutter/material.dart';

class BankChoseDialog{
  static void showBottomDialog(BuildContext context,List<BankInfo> data,Function onChose){
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return StatefulBuilder(builder: (context, state) {
        return Container(
          child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context,index){
                return getRow(context, data[index],onChose);
              },
              itemCount: data.length,
              scrollDirection: Axis.vertical),
        );
      });
    });
  }
  static Widget getRow(BuildContext context,BankInfo bank,Function onChose){
    return GestureDetector(
      child: Container(
        height: 50.0,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: Text(bank.bankName),
      ),
      onTap: (){
        onChose(bank);
        Navigator.pop(context);
      },
    );
  }
}
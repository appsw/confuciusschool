import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/model/MyPointsInfo.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class MyPointsPage extends StatefulWidget {
  @override
  _MyPointsPageState createState() => _MyPointsPageState();
}

class _MyPointsPageState extends BaseState {

  MyPointsInfo data;
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    api.getMyPoints((data){
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
    return PageUtils.getAppBar(context, "我的积分");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return data == null ? LoadingUtils.getRingLoading() : Container(
      child: Column(
        children: <Widget>[
          getHead(),
          getList()
        ],
      ),
    );
  }
  Widget getHead(){
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset("images/home04_11wodejifen_bj.png",width: MediaQuery.of(context).size.width,height: 137.0,fit: BoxFit.fill,),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 137.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(data.re,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: DefaultValue.titleTextSize
                  ),),
                Text("总积分",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: DefaultValue.titleTextSize
                  ),),
              ],
            ),
          )

        ],
      ),
    );
  }
  Widget getList(){
    return Container(
      height: MediaQuery.of(context).size.height - 220.0,
      color: Colors.white,
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: getRow,
          itemCount: data.sql.length,
          scrollDirection: Axis.vertical),
    );
  }
  Widget getRow(BuildContext context,int index){
    Sql sql = data.sql[index];
//    1.注册会员返积分2.购买Vip3.购买独立课程4.每日签到
    String type;
    switch(sql.type){
      case 1:
        type = "注册会员返积分";
        break;
      case 2:
        type = "购买Vip";
        break;
      case 3:
        type = "购买独立课程";
        break;
      case 4:
        type = "每日签到";
        break;
      default:
        type = "每日签到";
        break;
    }
    return Container(
        padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(type,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: DefaultValue.titleTextSize
                    ),),
              Text("${sql.createTime}",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: DefaultValue.textSize
                ),),
              ],
            ),

            Text("+${sql.pointsum}",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: DefaultValue.titleTextSize
              ),),
          ],
        )
    );
  }
}

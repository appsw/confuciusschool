import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/model/MyBuyInfo.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class MyBuyPage extends StatefulWidget {
  @override
  _MyBuyPageState createState() => _MyBuyPageState();
}

class _MyBuyPageState extends BaseState {

  List<MyBuyInfo> data;
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    api.getMyBuy((data){
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
    return PageUtils.getAppBar(context, "我的已购");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return data == null ?  LoadingUtils.getRingLoading() : getList();
  }
  Widget noData(){
    return Container(
      child: Text("没有数据"),
    );
  }
  Widget getList(){
    return Container(
      height: MediaQuery.of(context).size.height - 300.0,
      color: Colors.white,
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: getRow,
          itemCount: data.length,
          scrollDirection: Axis.vertical),
    );
  }
  Widget getRow(BuildContext context,int index){
    MyBuyInfo ress = data[index];
    return GestureDetector(
      onTap: (){
//        ShopPayDialog.showLoadingDialog(context, ress.name, "${ress.integral}积分 或 ¥${ress.money}", points, (int type){
//          print(type);
//        });
      },
      child: Container(
          padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(ress.brief,width: 350.0,height: 140.0,fit: BoxFit.fill,),
              Container(
                margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
                child: Text(ress.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: DefaultValue.titleTextSize
                  ),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("${ress.num}人购买",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: DefaultValue.textSize
                    ),),
                ],
              )
            ],
          )
      ),
    );
  }

}

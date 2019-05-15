import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/dialog/ShopPayDialog.dart';
import 'package:confuciusschool/model/MyPointsInfo.dart';
import 'package:confuciusschool/model/ShopInfo.dart';
import 'package:confuciusschool/page/MyBuyPage.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends BaseState{

  ShopInfo data;
  var points = "0";
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    api.getMyPoints((MyPointsInfo data){
      setState(() {
        points = data.re;
      });
    }, (msg){
      ToastUtil.makeToast(msg);
    });
    api.getShopInfo((data){
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
    return
    AppBar(
      title: Text("智慧超市",
        style: TextStyle(
            color: Colors.black
        ),),
      centerTitle: true,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      leading: PageUtils.getBackWidge(context),
      elevation: 0.0,
      actions: <Widget>[getAction()],
    );
  }
  Widget getAction(){
    return GestureDetector(
      onTap: (){
        NavigatorUtils.push(context, new MyBuyPage());
      },
      child: Container(
        alignment: Alignment.center,
        height: 60.0,
        margin: EdgeInsets.only(right: DefaultValue.rightMargin),
        child: Text("我的已购",
        style: TextStyle(
          fontSize: DefaultValue.textSize,
          color: Colors.black
        ),),
      ),
    );
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return data == null ? LoadingUtils.getRingLoading() : Container(
      child: Column(
        children: <Widget>[
          getSwiperBody(),
          getList()
        ],
      ),
    );
  }
  Widget getSwiperBody(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      color: Colors.white,
      alignment: Alignment.topCenter,
      child: Swiper(
        itemBuilder: _swiperBuilder,
        itemCount: data.res.length,
        pagination: null,
        control: null,
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: goBountyTask,

      ),
//      margin: EdgeInsets.only(top: 40.0,bottom: 40.0),
    );
  }
  Widget _swiperBuilder(BuildContext context, int index){

    Res res = data.res[index];
    return GestureDetector(
      onTap: (){

      },
      child: Image.network(res.img,
        width: 180.0,
        height: 400.0,
        fit: BoxFit.fill,),
    );
  }
  void goBountyTask(int index){


  }

  Widget getList(){
    return Container(
      height: MediaQuery.of(context).size.height - 300.0,
      color: Colors.white,
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: getRow,
          itemCount: data.ress.length,
          scrollDirection: Axis.vertical),
    );
  }
  Widget getRow(BuildContext context,int index){
    Ress ress = data.ress[index];
    return GestureDetector(
      onTap: (){
        ShopPayDialog.showLoadingDialog(context, ress.name, "${ress.integral}积分 或 ¥${ress.money}", points, (int type){
          print(type);
        });
      },
      child: Container(
          padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(ress.lcon,width: 350.0,height: 140.0,fit: BoxFit.fill,),
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
                  Text("${ress.integral}积分 或 ¥${ress.money}",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: DefaultValue.titleTextSize
                    ),),
                ],
              )
            ],
          )
      ),
    );
  }
}

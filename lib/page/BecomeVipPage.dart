import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/model/BecomeVipInfo.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class BecomeVipPage extends StatefulWidget {
  @override
  _BecomeVipPageState createState() => _BecomeVipPageState();
}

class _BecomeVipPageState extends BaseState {

  BecomeVipInfo data;
  var names = ["微信支付","支付宝支付","苹果支付"];
  var images = ["images/home04_7kaitong_weixin.png","images/home04_7kaitong_zhifubao.png","images/home04_7kaitong_pingguo.png"];
  var payType = 0;
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    api.getBecomeVipInfo((data){
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
    return PageUtils.getAppBar(context, "开通VIP");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return data == null ? LoadingUtils.getRingLoading : Container(
      color: ColorsUtil.GreyDialogBg,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            getTop(),
            getContent(),
            getList()
          ],
        ),
      ),
    );
  }
  Widget getTop(){
    return Container(
      height: 56.0,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      margin: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(data.account,
          style: TextStyle(
            color: Colors.black,
            fontSize: DefaultValue.textSize
          ),),
          Text("请开通VIP",
            style: TextStyle(
                color: Colors.grey,
                fontSize: DefaultValue.textSize
            ),)
        ],
      ),
    );
  }
  Widget getContent(){
    return Container(
      height: 400.0,
      color: Colors.white,
      padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
      margin: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
      child: Column(
        children: <Widget>[
          Container(
            height: 75.0,
            width: MediaQuery.of(context).size.width,
            color: ColorsUtil.GreyDialogBg,
            margin: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("¥${data.vip}/年",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: DefaultValue.textSize
                  ),),
                Text("全年VIP",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: DefaultValue.textSize
                  ),)
              ],
            ),
          ),
          Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("总计",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: DefaultValue.textSize
                  ),),
                Text("${data.vip}元",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: DefaultValue.textSize
                  ),),

              ],
            ),
          ),
          LinsUtils.getWidthLins(context),
          getTitle(0),
          getTitle(1),
          getTitle(2),
          getBtn(),
        ],
      ),
    );
  }
  Widget getTitle(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          payType = index;
        });
      },
      child: Container(
        height: 50.0,
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Image.asset(images[index],width: 25.0,height: 25.0,),
            Expanded(
              flex: 1,
              child:  Container(
                margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                child: Text(names[index],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: DefaultValue.textSize
                  ),),
              ),
            ),
            Image.asset(payType == index ? "images/home04_7kaitong_xuanzhong.png" : "images/home04_7kaitong_weixuanzhong.png",width: 13.0,height: 13.0,),
          ],
        ),
      ),
    );
  }
  Widget getBtn(){
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: FlatButton(
        onPressed: (){

          print('点击3333333333333333333333333333333333333333333333333333333333333333333333333333333');
        },
        color: ColorsUtil.LogBtnBg,//按钮的背景颜色
        padding: EdgeInsets.only(top:10.0,bottom: 10.0,left: 100.0,right: 100.0),//按钮距离里面内容的内边距
        child: new Text('确定付款',style: TextStyle(fontSize: DefaultValue.loginBtnSize),),
        textColor: Colors.white,//文字的颜色
        textTheme:ButtonTextTheme.normal ,//按钮的主题
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
  Widget getList(){

    return Container(
      height: 250.0,
      color: Colors.white,
      padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
      margin: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text("VIP权益：",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: DefaultValue.textSize
              ),),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemBuilder: getRow,
              itemCount: data.detail.length,
              scrollDirection: Axis.vertical)
        ],
      ),
    );
  }
  Widget getRow(BuildContext context,int index){
    Detail re4 = data.detail[index];
    return Container(
      height: 70.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("${re4.title}",
            style: TextStyle(
                color: Colors.black,
                fontSize: DefaultValue.textSize
            ),),
          Text("${re4.explain}",
            style: TextStyle(
                color: Colors.black,
                fontSize: DefaultValue.textSize
            ),),
        ],
      ),
    );
  }

}

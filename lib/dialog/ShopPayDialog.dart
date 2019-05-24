import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:flutter/material.dart';

class ShopPayDialog extends Dialog{
  var title;
  var price;
  var banlan;
  Function pay;
  ShopPayDialog(this.title,this.price,this.banlan,this.pay);
  var images = ["images/home04_10_1zhihuichaoshigoumaitanchuang_jifen.png","images/home04_10_1zhihuichaoshigoumaitanchuang_weixin.png",
  "images/home04_10_1zhihuichaoshigoumaitanchuang_zhifubao.png","images/home04_10_1zhihuichaoshigoumaitanchuang_pingguo.png"];
  var names = ["积分支付","微信支付","支付宝支付","内购支付"];
  var selectNum = 0;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, state) {
      return new Material( //创建透明层
          type: MaterialType.transparency, //透明类型
          child: new Center( //保证控件居中效果
            child: Container(
              width: 238.0,
              height: 315.0,
              padding: EdgeInsets.only(left: 20.0,right: 20.0,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: DefaultValue.textSize
                            ),),
                          Text(price,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: DefaultValue.titleTextSize
                            ),),
                          Text("可用积分$banlan",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: DefaultValue.smallTextSize
                            ),),
                        ],
                      ),
                    ),
                  ),
                  LinsUtils.getWidthLins(context),
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          getTitle(0,state),
                          getTitle(1,state),
                          getTitle(2,state),
                          getTitle(3,state),
                        ],
                      ),
                    ),
                  ),
                  LinsUtils.getWidthLins(context),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      child: getBtn(),
                    ),
                  ),
                ],
              ),
            ),
          )
      );
    });

  }
  Widget getBtn(){
    return Container(
      child: FlatButton(
        onPressed: (){
          pay(selectNum);
          print('点击3333333333333333333333333333333333333333333333333333333333333333333333333333333');
        },
        color: ColorsUtil.LogBtnBg,//按钮的背景颜色
        padding: EdgeInsets.only(top:10.0,bottom: 10.0,left: 58.0,right: 58.0),//按钮距离里面内容的内边距
        child: new Text('立即支付',style: TextStyle(fontSize: DefaultValue.loginBtnSize),),
        textColor: Colors.white,//文字的颜色
        textTheme:ButtonTextTheme.normal ,//按钮的主题
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );
  }
  Widget getTitle(int index,StateSetter setState){

      return GestureDetector(
        child: Container(
          padding: EdgeInsets.only(left: 20.0,right: 20.0,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Image.asset(images[index],width: 20.0,height: 20.0,),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
                  child: Text(names[index],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: DefaultValue.textSize
                    ),),
                ),
              ),
              Image.asset(selectNum == index ? "images/home04_8jingdiansucaifuzhi_duihao.png" : "images/home04_10_1zhihuichaoshigoumaitanchuang_weixuanzhong.png",width: 15.0,height: 15.0,),
            ],
          ),
        ),
        onTap: (){
          setState((){
            selectNum = index;
          });
        },
      );


  }

  static void showLoadingDialog(BuildContext context,var title,var price,var banlan,Function pay){
    showDialog(context: context,
        barrierDismissible: false,
        builder:(context){
          return new ShopPayDialog(title,price,banlan,pay);
        } );
  }
  static void dismissLoadingDialog(BuildContext context){
    Navigator.of(context).pop();
  }
}
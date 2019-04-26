import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/page/LoanPage.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_seekbar/flutter_seekbar.dart' show ProgressValue, SectionTextModel, SeekBar;
import 'package:confuciusschool/utils/NavigatorUtils.dart';
class BorrowPage extends BasefulWidget{

  List _banner = [
    "images/bannner.png"
  ];
  var moneyNum = "2000";

  Widget getBanner(){
    return Container(
      height: 162.0,
      child: Swiper(
        itemBuilder: _swiperBuilder,
        itemCount: _banner.length,
        pagination: null,
        control: null,
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index){},
//        viewportFraction: 0.8,
//        scale: 0.9,
      ),
    );
  }
  Widget _swiperBuilder(BuildContext context, int index){
//    _currentIndex = index;
    return Image.asset(_banner[index],
      width: 180.0,
      height: 60.0,
      fit: BoxFit.fill,);
  }
  Widget getMessage(){
    return Container(
      color: ColorsUtil.homeMessageBG,
      margin: EdgeInsets.only(top: 15.0),
      height: 34.0,
      padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Image.asset("images/gonggao.png",width: 18.0,height: 18.0,),
          Container(
            margin: EdgeInsets.only(left: 15.0),
            child: Text("用户李**成功借款5000元",
            style: TextStyle(
              color: ColorsUtil.blueTextColor,
              fontSize: DefaultValue.messageTextSize
            ),),
          )
        ],
      ),
    );
  }
  Widget getBorrow(){
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Stack(children: <Widget>[
        Image.asset("images/jeikuanbeijing.png"),
        getBorrowText()
      ],),
    );
  }
  Widget getBorrowText(){
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Text("借款金额(元)",
            style: TextStyle(
              color: Colors.white,
              fontSize: DefaultValue.textSize
            ),),
          ),
          Container(
            margin: EdgeInsets.only(top: 13.0),
            child: Text("$moneyNum.00",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
              ),),
          ),
          Container(
            margin: EdgeInsets.only(top: 28.0),
            child: Text("日利率最低0.03%",
              style: TextStyle(
                  color: ColorsUtil.lilvTextColor,
                  fontSize: DefaultValue.textSize
              ),),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
            margin: EdgeInsets.only(top: 19.0),
            width: 277,
            child: SeekBar(
              progresseight: 9,
              min: 0.0,
              max: 1.0,
              value: 0.25,
              backgroundColor: Colors.white,
              progressColor: ColorsUtil.SeekBarColor,
              onValueChanged: (ProgressValue value){
                print(value.progress);
                setState((){
                  moneyNum = (1000 + (4000 * value.progress)).toInt().toString();
                });
              },
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 12.0,left: 23.0,right: 23.0),
            child: Row(
              children: <Widget>[
                Expanded(flex: 1,
                  child: Text("1000",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: DefaultValue.textSize
                    ),),),
                Expanded(flex: 0,
                  child: Text("5000",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: DefaultValue.textSize
                    ),),),
              ],
              ),
          ),
        ],
      ),
    );
  }
  Widget getBoorowBtn(){
    return Container(
      margin: EdgeInsets.only(top: 27.0),
      child: FlatButton(
        onPressed: (){
          NavigatorUtils.push(context, LoanPage());
        },
        color: ColorsUtil.SeekBarColor,//按钮的背景颜色
        padding: EdgeInsets.only(top:12.0,bottom: 13.0,left: 145.0,right: 145.0),//按钮距离里面内容的内边距
        child: new Text('我要借款'),
        textColor: Colors.white,//文字的颜色
        textTheme:ButtonTextTheme.normal ,//按钮的主题
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );
  }
  Widget getTips(){
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 14.0,bottom: 34.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Text("温馨提示:",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: DefaultValue.smallTextSize
              ),),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text("1.借款需要官方专员审核，请耐心等待，注意接听电话。",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: DefaultValue.smallTextSize
              ),),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text("2.借款期限会根据您的综合评价由后台生成。",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: DefaultValue.smallTextSize
              ),),
          ),
        ],
      ),
    );
  }

  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return null;
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            getBanner(),
            getMessage(),
            getBorrow(),
            getBoorowBtn(),
            getTips()
          ],
        ),
      ),
    );
  }

}
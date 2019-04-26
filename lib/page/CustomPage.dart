import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/PageUtils.dart';

class CustomPage extends BasefulWidget{

  Widget getText(){
    return Container(
      height: 86.0,
      margin: EdgeInsets.only(left: 13.0,right: 13.0,top: 15.0),
      padding: EdgeInsets.only(left: 11.0,right: 13.0),
      decoration: new BoxDecoration(
          color:Colors.white,
          borderRadius:  new BorderRadius.all(Radius.circular(4.0)),
          boxShadow:  <BoxShadow>[//设置阴影
            new BoxShadow(
              color: Colors.grey,//阴影颜色
              blurRadius: 6.0,//阴影大小
            ),
          ]
      ),
      child: Column(
        children: <Widget>[
        GestureDetector(child: Container(padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
        color: Colors.white,
        child: Row(children: <Widget>[
          Expanded(flex: 0,child: Image.asset("images/dianhuahover.png",width: 19.0,height: 22.0,),),
          Expanded(flex: 1,child: Container(margin: EdgeInsets.only(left:  DefaultValue.leftMargin),child: Text("0532-0236598"),),),
        ],),),
        onTap: (){

          },
        ),
        GestureDetector(child: Container(padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
          color: Colors.white,
          child: Row(children: <Widget>[
            Expanded(flex: 0,child: Image.asset("images/QQ.png",width: 19.0,height: 22.0,),),
            Expanded(flex: 1,child: Container(margin: EdgeInsets.only(left:  DefaultValue.leftMargin),child: Text("3629586325"),),),
          ],),),
          onTap: (){

          },
        )
        ],
      ),
    );
  }

  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "客服");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      child: getText(),
    );
  }

}
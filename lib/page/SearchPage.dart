import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class SearchPage extends BasefulWidget{
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return null;
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      child: Column(
        children: <Widget>[
          getHead(),
        ],
      ),
    );
  }
  Widget getHead(){
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin,left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
      child: Row(
        children: <Widget>[

          Expanded(
            flex: 1,
            child: Container(
              height: 28.0,
              margin: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
              decoration: new BoxDecoration(
                  border: new Border.all(width: 1.0,color:ColorsUtil.HomeAppBarBg ),
                  color: ColorsUtil.HomeAppBarBg,
                  borderRadius:  new BorderRadius.all(Radius.circular(20.0))
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: Image.asset("images/home01_search.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: Text("请输入关键字、视频名称",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: DefaultValue.textSize
                      ),),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

}
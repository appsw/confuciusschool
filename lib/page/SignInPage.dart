import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignInPage extends BasefulWidget{

  var text = "我是1866366789,在孔子学堂APP学习已坚持1天，受益颇多，邀您一起学习！";
  var textController = TextEditingController();
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return AppBar(
      title: Text("签到打卡",
        style: TextStyle(
            color: Colors.black
        ),),
      centerTitle: true,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      leading: PageUtils.getBackWidge(context),
      elevation: 0.0,
      actions: <Widget>[
        GestureDetector(
          onTap: (){},
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                  height: 20.0,
                  width: 50.0,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: DefaultValue.rightMargin),
                  decoration: new BoxDecoration(
                      color: ColorsUtil.SigninTitleBg,
                      borderRadius:  new BorderRadius.only(topLeft: Radius.circular(0.0),topRight: Radius.circular(5.0),bottomLeft: Radius.circular(5.0),bottomRight: Radius.circular(0.0))
                  ),
                  child: Text("连签1天",
                    style: TextStyle(
                        color: Colors.white,
                      fontSize: DefaultValue.smallTextSize
                    ),),
                ),
                Container(
                  margin: EdgeInsets.only(right: DefaultValue.rightMargin),
                  alignment: Alignment.center,
                  child: Image.asset("images/home04_qiandao.png"),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 31.0,right: 31.0,top: 25.0),
              child: Stack(
                children: <Widget>[
                  Image.asset("images/home04_4_1jifendaka_img1.png",),
                  Container(
                    height: 500,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 7,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.only(left: 26.0,right: 26.0),
                            child: Column(
                              children: <Widget>[
                                Text("$text",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: DefaultValue.textSize
                                  ),),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: getTime(),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: getApp(),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            getJiang(),
            getBottom()
          ],
        ),
      ),
    );
  }
  Widget getTime(){

    DateTime now = DateTime.now();
    print(now.year);
    print(now.month);
    print(now.day);
    print(now.weekday);
    return Container(
      alignment: Alignment.bottomLeft,
      height: 70.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text("${now.day}/",
            style: TextStyle(
                color: ColorsUtil.GreyTextColor,
                fontSize: 25.0
            ),),
          Container(
            height: 70.0,
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("星期${now.weekday}",
                  style: TextStyle(
                      color: ColorsUtil.GreyTextColor,
                      fontSize: DefaultValue.smallTextSize
                  ),),
                Text("${now.month}/${now.year}",
                  style: TextStyle(
                      color: ColorsUtil.GreyTextColor,
                      fontSize: DefaultValue.smallTextSize
                  ),)
              ],
            ),
          )
        ],
      ),
    );

  }
  Widget getApp(){
    return Container(
      height: 75.0,
      alignment: Alignment.bottomRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Image.asset("images/home04_4_1jifendaka_app.png",height: 49.0,width: 49.0,),
          Container(
            margin: EdgeInsets.only(top: DefaultValue.topMargin),
            child: Text("孔子学堂APP",
              style: TextStyle(
                  color: ColorsUtil.GreyTextColor,
                  fontSize: DefaultValue.smallTextSize
              ),),
          )
        ],
      ),
    );
  }
  Widget getJiang(){
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerRight,
      child: new ClipOval(
        child: SizedBox(
            width: 60.0,
            height: 60.0,
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Image.asset("images/home04_4_1jifendaka_choujiang.png",width: 39.0,height: 36.0,),
                  Text("抽奖",
                    style: TextStyle(
                        color: ColorsUtil.GreyTextColor,
                        fontSize: DefaultValue.smallTextSize
                    ),)
                ],
              ),
            )
        ),
      ),
    );
  }
  Widget getBottom(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){

              },
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/home04_4_1jifendaka_genghuantupian.png",width: 20.0,height: 18.0,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6.0),
                      child: Text("更换图片",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                showBottomDialog(context);
              },
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/home04_4_1jifendaka_bianjiwenzi.png",width: 20.0,height: 18.0,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6.0),
                      child: Text("编辑文字",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                getEditbrand();
              },
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/home04_4_1jifendaka_bianjipinpai.png",width: 20.0,height: 18.0,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6.0),
                      child: Text("编辑品牌",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                getShare();
              },
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/home04_4_1jifendaka_fenxiang.png",width: 20.0,height: 18.0,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6.0),
                      child: Text("保存分享",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void showBottomDialog(BuildContext context){
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return StatefulBuilder(builder: (context, state) {
        return Container(
          height: 326.0,
          color: ColorsUtil.GreyDialogBg,
          child: Container(
            color: Colors.white,
            height: 60.0,
            margin: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: 120.0),
            child: TextField(
              controller: textController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(2.0),
                border: InputBorder.none,
                hintText: '编辑文字...',
                prefixStyle: new TextStyle(height: 20.0),
                hintStyle: new TextStyle(color: ColorsUtil.GreyTextColor,fontSize: DefaultValue.messageTextSize),
              ),
            ),
          ),
        );
      });
    });
  }
  Widget getEditbrand(){
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return StatefulBuilder(builder: (context, state) {
        return Container(
          height: 326.0,
          color: ColorsUtil.GreyDialogBg,
          padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("上传完成二维码或LOGO",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: DefaultValue.textSize
                ),),
              Container(
                margin: EdgeInsets.only(top: DefaultValue.topMargin),
                child: Image.asset("images/home04_4_3jifendaka_tianjiatupian.png",width: 44.0,height: 44.0,),
              ),
              Container(
                margin: EdgeInsets.only(top: DefaultValue.topMargin),
                child: Text("更换品牌名",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: DefaultValue.textSize
                  ),),
              ),
              Container(
                margin: EdgeInsets.only(top: DefaultValue.topMargin),
                child: Container(
                  color: Colors.white,
                  height: 43.0,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,),
                  child: TextField(
                    controller: textController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(2.0),
                      border: InputBorder.none,
                      hintText: '编辑文字...',
                      prefixStyle: new TextStyle(height: 20.0),
                      hintStyle: new TextStyle(color: ColorsUtil.GreyTextColor,fontSize: DefaultValue.messageTextSize),
                    ),
                  ),
                ),
              ),
              Container(
                margin:  EdgeInsets.only(top: DefaultValue.topMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("取消",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: DefaultValue.textSize
                      ),),
                    Container(
                      height: 25.0,
                      width: 50.0,
                      margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                      alignment: Alignment.center,
                      decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius:  new BorderRadius.all(Radius.circular(13.0))
                      ),
                      child: Text("确定",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: DefaultValue.textSize
                        ),),

                    )
                  ],
                ),
              )
            ],
          ),
        );
      });
    });
  }
  Widget getShare(){
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return StatefulBuilder(builder: (context, state) {
        return Container(
          height: 207.0,
          color: ColorsUtil.GreyDialogBg,
          padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("分享给家长或老师",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: DefaultValue.textSize
                ),),
              Container(
                margin: EdgeInsets.only(top: 25.0,bottom: 25.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Image.asset("images/home04_4_4jifendakafenxiang_weixin.png"),
                            margin: EdgeInsets.only(bottom: DefaultValue.bottomMargin),
                          ),
                          Text("微信好友",
                            style: TextStyle(
                                color: ColorsUtil.GreyTextColor,
                                fontSize: DefaultValue.textSize
                            ),)
                        ],
                      ),
                      margin: EdgeInsets.only(right: 50.0),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 50.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Image.asset("images/home04_4_4jifendakafenxiang_pengyouquan.png"),
                            margin: EdgeInsets.only(bottom: DefaultValue.bottomMargin),
                          ),
                          Text("朋友圈",
                            style: TextStyle(
                                color: ColorsUtil.GreyTextColor,
                                fontSize: DefaultValue.textSize
                            ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              LinsUtils.getWidthLins(context),
              Container(
                child: Text("取消",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: DefaultValue.textSize
                  ),),
                margin: EdgeInsets.only(top: DefaultValue.topMargin),

              )
            ],
          ),
        );
      });
    });
  }

}
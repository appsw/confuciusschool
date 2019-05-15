import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class ExtensionPage extends StatefulWidget {
  @override
  _ExtensionPageState createState() => _ExtensionPageState();
}

class _ExtensionPageState extends BaseState {

  String url;
  bool isShow = false;
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    api.getExtension((data){
      setState(() {
        this.url = data;
      });
    }, (msg){
      ToastUtil.makeToast(msg);
    });
  }
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return AppBar(
      title: Text("推广海报",
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
//        NavigatorUtils.push(context, new MyBuyPage());
      },
      child: Container(
        alignment: Alignment.center,
        height: 60.0,
        margin: EdgeInsets.only(right: DefaultValue.rightMargin),
        child: Image.asset("images/home04_6_1tuiguang_xiangqing_fenxiang.png",width: 21.0,height: 21.0,),
      ),
    );
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return url == null ? LoadingUtils.getRingLoading() : Container(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
            child: Image.network(url,width: MediaQuery.of(context).size.width,),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isShow = !isShow;
                    });
                  },
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(bottom: DefaultValue.bottomMargin,top: DefaultValue.topMargin),
                    child: Row(
                      children: <Widget>[
                        Text("二维码使用指南",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: DefaultValue.titleTextSize
                          ),),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(right: DefaultValue.rightMargin),
                            child: Text("了解情况",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: DefaultValue.textSize
                              ),),
                          ),
                        ),
                        isShow ? Image.asset("images/home04_6tuiguang_jiantou.png",width: 14.0,height: 8.0,) :Image.asset("images/home04_5_2_1tianjiayinhangka_xiala.png",width: 14.0,height: 8.0,)
                      ],
                    ),
                  ),
                ),
                isShow ? Container(
                  color: Colors.white,
                  height: 384.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("奖金如何赚得",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: DefaultValue.titleTextSize
                      ),),
                      Text("一.奖金获得",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: DefaultValue.titleTextSize
                        ),),
                      Text("注：分享二维码链接或任意课程链接至微信、微博、QQ，给好友，注册微课传奇APP，成为您的下级学员。",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: DefaultValue.textSize
                        ),),
                      Text("二.奖金计算",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: DefaultValue.titleTextSize
                        ),),
                      Text("(1) 推广奖学金：您推荐学员A注册APP平台并开通年度VIP365元，您可以得到50元的现金奖励。",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                      Text("推广奖学金：您推荐学员A注册APP平台并开通年度VIP365元，您可以得到50元的现金奖励。推广奖学金您推荐学员A注册APP平台并开通年度VIP365元，您可得到50元的现金奖励。",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                    ],
                  ),
                ) : Container()
              ],
            ),
          )
        ],
      ),
    );
  }
}

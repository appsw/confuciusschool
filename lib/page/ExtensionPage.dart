import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ExtensionPage extends StatefulWidget {
  @override
  _ExtensionPageState createState() => _ExtensionPageState();
}

class _ExtensionPageState extends BaseState {

  String url;
  bool isShow = false;
  String html;
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
    api.getGuide((data){
      setState(() {
        this.html = data;
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
            child: Image.network(url,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,fit: BoxFit.fill,),
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
                isShow ? getWebView(html) : Container()
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget getWebView(var html){
    return Container(
      height: 384,
      color: Colors.white,
      child: Html(
        data: html,
        //Optional parameters:
        backgroundColor: Colors.white70,
        defaultTextStyle: TextStyle(fontFamily: 'serif'),
        linkStyle: const TextStyle(
          color: Colors.redAccent,
        ),
        onLinkTap: (url) {
          // open url in a webview
        },
      ),
    );
  }
}

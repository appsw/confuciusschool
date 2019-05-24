import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/model/AboutInfo.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class AboutPage extends BasefulWidget{
  AboutInfo data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    api.getAbout((data){
      setState((){
        this.data = data;
      });
    }, (msg){
      ToastUtil.makeToast(msg);
    });
  }
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "关于我们");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return data == null ? LoadingUtils.getRingLoading() : Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: 313.0,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset("${data.re.img}",width: 100.0,height: 100.0,),
                  Text("${data.re.title}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: DefaultValue.titleTextSize
                  ),),
                  Text("${data.re.explain}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: DefaultValue.titleTextSize
                    ),),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Container(
                height:160.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("客服QQ：${data.wechatqq}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.textSize
                      ),),
                    Text("客服微信：${data.wechatCode}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.textSize
                      ),),
                    Text("商务合作QQ：${data.qq}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.textSize
                      ),),
                    Text("商务合作微信：${data.wechat}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.textSize
                      ),),
                    Text("${data.tel}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.textSize
                      ),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
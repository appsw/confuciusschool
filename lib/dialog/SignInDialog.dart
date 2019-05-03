import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:flutter/material.dart';

class SignInDialog extends Dialog{
  var names = ["第一天","第二天","第三天","第四天","第五天","第六天","第七天"];
  var nums = ["+5","+5","+10","+5","+5","+5","+10",];
  Function signin;
  SignInDialog(this.signin);
  @override
  Widget build(BuildContext context) {
    return new Material( //创建透明层
      type: MaterialType.transparency, //透明类型
      child: new Center( //保证控件居中效果
        child: Container(
          width: 350.0,
          height: 500.0,
          child: Stack(
            children: <Widget>[
              Image.asset("images/home04_4jifendakaqiandao_qiandao.png",width: 350.0,height: 500.0,),
              Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 350.0,
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: Image.asset("images/home04_4jifendakaqiandao_close.png",width: 26.0,height: 26.0,),
                          onTap: (){
                            dismissLoadingDialog(context);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 17,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("每日签到",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0
                                  ),),
                                  Text("连签7天，共领取55积分(价值11元)",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.0
                                    ),),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      getDay(0),
                                      getDay(1),
                                      getDay(2),
                                      getDay(3),
                                      getDay(4),
                                      getDay(5),
                                      getDay(6),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15.0),
                                    child: FlatButton(
                                      onPressed: (){
                                        if(signin != null){
                                          signin();
                                        }

                                        print('点击3333333333333333333333333333333333333333333333333333333333333333333333333333333');
                                      },
                                      color: ColorsUtil.SignInBtnBg,//按钮的背景颜色
                                      padding: EdgeInsets.only(top:10.0,bottom: 10.0,left: 40.0,right: 40.0),//按钮距离里面内容的内边距
                                      child: new Text('签到并领取积分',style: TextStyle(fontSize: DefaultValue.loginBtnSize),),
                                      textColor: Colors.white,//文字的颜色
                                      textTheme:ButtonTextTheme.normal ,//按钮的主题
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(18)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                    Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(left: 20.0,right: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("连签规则",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.0
                                    ),),
                                  Text("1.连续签到第3天获得10积分，第七天获得20积分，其余每天获得5积分",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.0
                                    ),),
                                  Text("2.签到中断需要重新计算连签天数",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.0
                                    ),),
                                  Text("3.积分用途：可下载积分文档和观看视频",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.0
                                    ),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget getDay(int index){
    return Container(
      height: 80.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(names[index],
          style: TextStyle(
            color: Colors.black,
            fontSize: DefaultValue.textSize
          ),),
          Image.asset("images/home04_4jifendakaqiandao_jinbi.png",width: 15.0,height: 15.0,),
          Text(nums[index],
            style: TextStyle(
                color: Colors.black,
                fontSize: DefaultValue.textSize
            ),),
        ],
      ),
    );
  }
  static void showLoadingDialog(BuildContext context,Function signin){
    showDialog(context: context,
        barrierDismissible: false,
        builder:(context){
          return new SignInDialog(signin);
        } );
  }
  static void dismissLoadingDialog(BuildContext context){
    Navigator.of(context).pop();
  }
}

import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:flutter/material.dart';

class BeComeVipDialog extends Dialog{
  Function pay;
  BeComeVipDialog(this.pay);
  @override
  Widget build(BuildContext context) {
    return new Material( //创建透明层
      type: MaterialType.transparency, //透明类型
      child: new Center( //保证控件居中效果
        child: new SizedBox(
          width: 238.0,
          height: 172.0,
          child: new Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("您还不是孔子学堂VIP",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.textSize
                        ),),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text("开通孔子学堂VIP",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: DefaultValue.smallTextSize
                                ),),
                              Text("可免费听全年VIP课程呦",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: DefaultValue.smallTextSize
                                ),),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                LinsUtils.getWidthLins(context),
                Container(
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        child: Text("关闭",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: DefaultValue.textSize
                          ),),
                        onTap: (){
                          dismissLoadingDialog(context);
                          dismissLoadingDialog(context);
                        },
                      ),
                      LinsUtils.getHeightLins(context,height: 40.0),
                      GestureDetector(
                        child: Text("开通VIP",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: DefaultValue.textSize
                          ),),
                        onTap: (){
                          dismissLoadingDialog(context);
                          dismissLoadingDialog(context);
                          pay();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  static void showLoadingDialog(BuildContext context,Function pay){
    showDialog(context: context,
        barrierDismissible: false,
        builder:(context){
          return new BeComeVipDialog(pay);
        } );
  }
  static void dismissLoadingDialog(BuildContext context){
    Navigator.of(context).pop();
  }
}
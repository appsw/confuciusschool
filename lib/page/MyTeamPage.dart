import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/model/MyTeamInfo.dart';
import 'package:confuciusschool/page/MyTeamMemberPage.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
class MyTeamPage extends StatefulWidget {
  @override
  _MyTeamPageState createState() => _MyTeamPageState();
}

class _MyTeamPageState extends BaseState{

  MyTeamInfo data;
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "我的团队");
  }

  @override
  void initData() {
    // TODO: implement initState
    super.initData();
    api.getMyTeam((data){
      setState((){
        this.data = data;
      });
    }, (msg){
      ToastUtil.makeToast(msg);
    });
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody

    return data == null ? LoadingUtils.getRingLoading() : Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 150.0,
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Image.asset("images/home04_3tuandui_tubiao.png",width: 100.0,height: 100.0,),
                Container(
                  width: 100.0,height: 100.0,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20.0),
                  child: Text("总人数${data.sum}",style:
                  TextStyle(
                      color: Colors.white,
                      fontSize: DefaultValue.textSize
                  ),),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: 78.0,
            margin: EdgeInsets.only(top: DefaultValue.topMargin),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${data.isused}",style:
                        TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                        Text("已用名额",style:
                        TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${data.notused}",style:
                        TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                        Text("未用名额",style:
                        TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: DefaultValue.topMargin),
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
              color: Colors.white,
              height: 54.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("我的会员",style:
                    TextStyle(
                        color: Colors.black,
                        fontSize: DefaultValue.textSize
                    ),),
                  ),
                  Text("${data.sum}",style:
                  TextStyle(
                      color: Colors.black,
                      fontSize: DefaultValue.textSize
                  ),),
                ],
              ),
            ),
            onTap: (){
              NavigatorUtils.push(context, new MyTeamMemberPage());
            },
          )
        ],
      ),
    );
  }
}


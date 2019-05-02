import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/model/MemberInfo.dart';
import 'package:confuciusschool/page/AccountPage.dart';
import 'package:confuciusschool/page/MyTeamPage.dart';
import 'package:confuciusschool/page/NewsPage.dart';
import 'package:confuciusschool/page/PersonalDataSettingPage.dart';
import 'package:confuciusschool/page/SettingPage.dart';
import 'package:confuciusschool/page/SignInPage.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:flutter/widgets.dart';
import 'package:confuciusschool/page/AuthenticationPage.dart';
import 'package:confuciusschool/page/CustomPage.dart';
import 'package:confuciusschool/page/LoginPage.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends BaseState {

  List Names  = ["朋友圈必发素材","朋友圈必发课程","智慧超市","我的积分","我的收藏","建议反馈","活动中心"];
  var Icons = ["images/home04_sucai.png","images/home04_kecheng.png","images/home04_chaoshi.png","images/home04_wodejifen.png","images/home04_wodeshoucang.png","images/home04_fankui.png","images/home04_huodongzhongxin.png"];
  Listinfo data;
  Widget getBG(){
    return Container(
      child: Column(
        children: <Widget>[
//          Image.asset("images/gernebeijing.png",fit: BoxFit.fitWidth,),
          Expanded(
            flex: 1,
            child: Container(
            ),
          )
        ],
      ),
    );
  }

  Widget getbody(){
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            getHead(),
            getBtn(),
            getInvitation(),
            getTop(),
            getBottom()
          ],
        ),
      ),
    );
  }
  Widget getInvitation(){
    return Container(
      padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin),
      margin: EdgeInsets.only(top: DefaultValue.topMargin),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(right: 5.0),
                  decoration: new BoxDecoration(
                      border: new Border.all(width: 1.0,color:Colors.red ),
                      color: Colors.white,
                      borderRadius:  new BorderRadius.all(Radius.circular(26.0))
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("images/home04_invite1.png",width: 27.0,height: 27.0,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("邀请好友免费体验",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: DefaultValue.textSize
                              ),),
                            Text("立得10积分",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: DefaultValue.smallTextSize
                              ),),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 5.0),
                  decoration: new BoxDecoration(
                      border: new Border.all(width: 1.0,color:ColorsUtil.PersionalYellow ),
                      color: ColorsUtil.PersionalYellow,
                      borderRadius:  new BorderRadius.all(Radius.circular(26.0))
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("images/home04_yaoqinghaoyou.png",width: 27.0,height: 27.0,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("邀请好友付费加入",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: DefaultValue.textSize
                              ),),
                            Text("立得50元",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: DefaultValue.smallTextSize
                              ),),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          data.isVip == 1 ? getBecomeVip() :Container()
    ],
      ),
    );
  }
  Widget getBecomeVip(){
    return Container(
      margin: EdgeInsets.only(top: DefaultValue.topMargin),
      decoration: new BoxDecoration(
          border: new Border.all(width: 1.0,color:Colors.red ),
          color: Colors.white,
          borderRadius:  new BorderRadius.all(Radius.circular(23.0))
      ),
      child: Container(
        padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/home04_invite1.png",width: 27.0,height: 27.0,),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                child: Row(
                  children: <Widget>[
                    Text("开通VIP，",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.textSize
                      ),),
                    Text("全年免费听课",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: DefaultValue.textSize
                      ),),
                  ],
                ),
              ),
            ),

            Text("立即开通",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: DefaultValue.smallTextSize
              ),),

          ],
        ),
      ),
    );
  }
  Widget getHeadImg(String url){
    return new ClipOval(
      child: SizedBox(
          width: 72.0,
          height: 72.0,
          child: url == null ?  Image.asset("images/home04_touxiang.png", fit: BoxFit.cover) :Image.network(url, fit: BoxFit.cover)
      ),
    );
  }

  Widget getHead(){
    return Container(
      height: 100.0,
      color: Colors.white,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20.0),
      child: Row(
        children: <Widget>[
          getHeadImg(data.profilePhoto),
          Expanded(
            flex: 1,
            child: Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(data.nickName,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: DefaultValue.textSize
                          ),),
                        GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                            child: Image.asset("images/home04_bianji.png",width: 14.0,height: 14.0,),
                          ),
                          onTap: (){
                            NavigatorUtils.push(context, PersonalDataPage());
                          },
                        )
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 250.0,
                      child: Container(
                        padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
                        margin: EdgeInsets.only(top: DefaultValue.topMargin),
                        decoration: new BoxDecoration(
                            border: new Border.all(width: 1.0,color:Colors.red ),
                            color: Colors.red,
                            borderRadius:  new BorderRadius.all(Radius.circular(10.0))
                        ),
//                  alignment: Alignment.center,
                        child: Text("推广大使",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: DefaultValue.smallTextSize
                          ),),
                      ),
                    )

                  ],
                )
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              margin: EdgeInsets.only(right: DefaultValue.rightMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("推广码",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: DefaultValue.smallTextSize
                    ),),
                  Text(data.invitecode,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: DefaultValue.smallTextSize
                    ),),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
  Widget getTop(){
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.only(left: 11.0,right: 13.0),
//      decoration: new BoxDecoration(
//          color:Colors.white,
//          borderRadius:  new BorderRadius.all(Radius.circular(14.0)),
//          boxShadow:  <BoxShadow>[//设置阴影
//            new BoxShadow(
//              color: Colors.grey,//阴影颜色
//              blurRadius: 6.0,//阴影大小
//            ),
//          ]
//      ),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          getTitle(0),
          LinsUtils.getWidthLins(context),
          getTitle(1),
        ],
      ),
    );
  }
  Widget getBottom(){
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      padding: EdgeInsets.only(left: 11.0,right: 13.0),
//      decoration: new BoxDecoration(
//          color:Colors.white,
//          borderRadius:  new BorderRadius.all(Radius.circular(14.0)),
//          boxShadow:  <BoxShadow>[//设置阴影
//            new BoxShadow(
//              color: Colors.grey,//阴影颜色
//              blurRadius: 6.0,//阴影大小
//            ),
//          ]
//      ),
      color:Colors.white,
      child: Column(
        children: <Widget>[
          getTitle(2),
          LinsUtils.getWidthLins(context),
          getTitle(3),
          LinsUtils.getWidthLins(context),
          getTitle(4),
          LinsUtils.getWidthLins(context),
          getTitle(5),
        ],
      ),
    );
  }
  Widget getTitle(int index){
    return GestureDetector(child: Container(padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 20.0,bottom: 20.0),
      color: Colors.white,
      child: Row(children: <Widget>[
        Expanded(flex: 0,child: Image.asset(Icons[index],width: 19.0,height: 22.0,),),
        Expanded(flex: 1,child: Container(margin: EdgeInsets.only(left:  DefaultValue.leftMargin),child: Text(Names[index]),),),
        Expanded(flex: 0,child: Image.asset("images/home04_5_1tixinadaoyinhangka_gengduo.png",width: 12.0,height: 13.0,),)
      ],),),
      onTap: (){
        switch(index){
          case 0:
            NavigatorUtils.push(context, AuthenticationPage());
            break;
          case 1:

            break;
          case 2:

            break;
          case 3:

            break;
          case 4:
            NavigatorUtils.push(context, CustomPage());
            break;
          case 5:
            NavigatorUtils.push(context, LoginPage());
            break;

        }
      },);
  }

  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return AppBar(
      title: Text("个人中心",
        style: TextStyle(
            color: Colors.black
        ),),
      centerTitle: true,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          child: Image.asset("images/home04_xiaoxi.png",height: 21.0,width: 21.0,fit: BoxFit.fill,),
        ),
        onTap: (){
          NavigatorUtils.push(context, new NewsPage());
        },
      ),
      actions: <Widget>[
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(right: DefaultValue.rightMargin),
            alignment: Alignment.center,
            child: Image.asset("images/home04_shezhi.png",height: 21.0,width: 21.0,fit: BoxFit.fill,),
          ),
          onTap: (){
            NavigatorUtils.push(context, new SettingPage());
          },
        )
      ],
      elevation: 0.0,
    );
  }
  Widget getBtn(){
    return Container(
      margin: EdgeInsets.only(top: DefaultValue.topMargin),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                NavigatorUtils.push(context, MyTeamPage());
              },
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/home04_tuandui.png",width: 43.0,height: 43.0,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: DefaultValue.topMargin),
                      child: Text("团队",
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
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/home04_qiandao.png",width: 43.0,height: 43.0,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: DefaultValue.topMargin),
                      child: Text("签到抽奖",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                    ),
                  ],
                ),
              ),
              onTap: (){
                NavigatorUtils.push(context, SignInPage());
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                NavigatorUtils.push(context, AccountPage());
              },
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/home04_zhanghu.png",width: 43.0,height: 43.0,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: DefaultValue.topMargin),
                      child: Text("账户",
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

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      child: Stack(
        children: <Widget>[
//          getBG(),
          data == null ? LoadingUtils.getRingLoading() : getbody()
        ],
      ),
    );
  }
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    api.getMember((MemberInfo data){
      setState(() {
        this.data = data.listinfo;
      });
    }, (msg){
      ToastUtil.makeToast(msg);
    });
  }
}
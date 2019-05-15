import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/page/AncientChinesePage.dart';
import 'package:confuciusschool/page/EntrepreneurshipPage.dart';
import 'package:confuciusschool/page/LegendChinaPage.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/page/BorrowPage.dart';
import 'package:confuciusschool/page/LoginPage.dart';
import 'package:confuciusschool/page/PersonalPage.dart';
import 'package:confuciusschool/page/RepayPage.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/Constant.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/SharedPreferencesUtil.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends BaseState {

  // 底部导航栏的文字 ， 给appBar 共用一下。
  var _bottomTitles = ["国学+","中国故事","","一起创业", "个人中心"];
  // 底部导航栏未选中时的图片
  var _bottomIconNor = [
    "images/home_guoxue_unchecked.png",
    "images/home01_icon_zhongguogushi.png",
    "images/home01_icon_guangpan.png",
    "images/home01_icon_yiqichuangye.png",
    "images/home01_icon_gerenzhongxin.png"
  ];

  // 底部导航栏选中时的图片
  var _bottomIconChecked = [
    "images/home01_icon_guoxue_xuanzhong.png",
    "images/home02_zhongguogushi_xuanzhong.png",
    "images/home01_icon_guangpan.png",
    "images/home03_yiqichuangye_xuanzhong.png",
    "images/home04_gerenzhongxin_xuanzhong.png"
  ];
  // 底部导航栏当前选中的页面
  int currentBottomIndex = 0;
  //添加图片地址,需要动态更换图片
  String bigImg = 'images/home01_icon_guangpan.png';
  // 页面
  var _body;

  Widget getBottomBar(){
    return Container(
      height: 60.0,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              items: getBottomNavigationBarItems(),
              currentIndex: currentBottomIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                setState(() {
                  currentBottomIndex = index;
                  if (currentBottomIndex != 2) {
                    setState(() {
                      this.bigImg = 'images/home01_icon_guangpan.png';
                    });
                  }
                });
              },
            ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 1.0),
                child: InkWell(
                  child: new Image.asset(
                    bigImg,
                    width: 50.0,
                    height: 50.0,
                  ),
                  onTap: onBigImgTap,
                ),
              )),
        ],
      ),
    );
  }
  getBottomNavigationBarItems() => List.generate(
      _bottomTitles.length,
          (index) => BottomNavigationBarItem(
          icon: getBottomIcon(index), title: getBottomTitle(index)));

  getBottomTitle(int i) => Text(
    _bottomTitles[i],
    style: TextStyle(
      color: currentBottomIndex == i ? ColorsUtil.blueTextColor : Colors.grey,
      fontSize: 14.0,),
  );

  getBottomIcon(int i) => i == 1 ? Image.asset(
    getBottomIconPath(i),
    width:20.0,
    height: 20.0,
  ) : Image.asset(
    getBottomIconPath(i),
    width: 20.0,
    height: 20.0,
  );

  String getBottomIconPath(int i) =>
      currentBottomIndex == i ? _bottomIconChecked[i] : _bottomIconNor[i];
  void checkIsLogin(BuildContext context){
    SharedPreferencesUtil.getString(Constant.ISLOGIN).then((s){
      if (s == null  || s != "1"){
        NavigatorUtils.pushAndRemoveUntil(context, LoginPage());
//        Navigator.pushAndRemoveUntil(
//            context,
//            MaterialPageRoute(
//                builder: (context) => LoginPage()),(route) => route == null);
      }
    });
  }
  //添加图片的点击事件
  void onBigImgTap() {
    setState(() {
//      this.currentBottomIndex = 2;
//      this.bigImg = 'images/home01_icon_guangpan.png';
    });
  }

  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return null;
  }
  @override
  void onCreate(BuildContext context) {
    // TODO: implement onCreate
    super.onCreate(context);
    _body = IndexedStack(
      children: <Widget>[AncientChinese(),LegendChinaPage(), PersonalPage(),EntrepreneurshipPage(), PersonalPage()],
      index: currentBottomIndex,
    );
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody

    return _body;
  }
  @override
  Widget getBottomNavigationBar(BuildContext context) {
    // TODO: implement getBottomNavigationBar
    return getBottomBar();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkIsLogin(context);
  }
}
import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/model/AudioInfo.dart';
import 'package:confuciusschool/page/AudioPlayPage.dart';
import 'package:confuciusschool/page/NewsPage.dart';
import 'package:confuciusschool/page/SearchPage.dart';
import 'package:confuciusschool/page/SearchResultAudioListPage.dart';
import 'package:confuciusschool/page/SearchResultListPage.dart';
import 'package:confuciusschool/page/VideoPlayPage.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class LegendChinaPage extends StatefulWidget {
  @override
  _LegendChinaPageState createState() => _LegendChinaPageState();
}

class _LegendChinaPageState extends BaseState {
  AudioInfo homeInfo;
  var controller = new ScrollController();

  @override
  void initData() {
    // TODO: implement initState
    super.initData();
    api.getAudioData((data){
      setState((){
        this.homeInfo = data;
      });
    }, (msg){
      ToastUtil.makeToast(msg);
    });
  }
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return null;
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return homeInfo == null ? LoadingUtils.getRingLoading() : SingleChildScrollView(
      controller: controller,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            getHead(),
            getSwiperBody(),
            getBtn(),
            getRecommend(),
            getFree(),
            getSleep(),
            getCelebrity(),
            getIdiom(),
            getPoetry()
          ],
        ),
      ),
    );
  }

  Widget getHead(){
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      color: Colors.white,
      padding: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin,left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Image.asset("images/home01_qiandao.png"),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
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
              onTap: (){
                NavigatorUtils.push(context, new SearchResultAudioListPage(0));

              },
            ),
          ),
          Expanded(
            flex: 0,
            child: GestureDetector(
              child: Image.asset("images/home01_xiaoxi.png"),
              onTap: (){
                NavigatorUtils.push(context, new NewsPage());
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget getBtn(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: DefaultValue.topMargin),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                NavigatorUtils.push(context, new SearchResultAudioListPage(1));
              },
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/home02_icon_shuiqiangushi.png",width: 43.0,height: 43.0,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: DefaultValue.topMargin),
                      child: Text("睡前故事",
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
                NavigatorUtils.push(context, new SearchResultAudioListPage(2));
              },
              child:Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/home02_icon_mingrenzhuanji.png",width: 43.0,height: 43.0,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: DefaultValue.topMargin),
                      child: Text("名人传记",
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
                NavigatorUtils.push(context, new SearchResultAudioListPage(3));
              },
              child:Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/home02_icon_chengyugushi.png",width: 43.0,height: 43.0,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: DefaultValue.topMargin),
                      child: Text("成语故事",
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
                NavigatorUtils.push(context, new SearchResultAudioListPage(4));
              },
              child:Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/home02_icon_shicijingdian.png",width: 43.0,height: 43.0,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: DefaultValue.topMargin),
                      child: Text("诗词经典",
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
                NavigatorUtils.push(context, new SearchResultAudioListPage(0));
              },
              child:Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/home02_icon_quanbufenlei.png",width: 43.0,height: 43.0,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: DefaultValue.topMargin),
                      child: Text("全部分类",
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
  Widget getSwiperBody(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      color: Colors.white,
      alignment: Alignment.topCenter,
      child: Swiper(
        itemBuilder: _swiperBuilder,
        itemCount: homeInfo.lb.length,
        pagination: null,
        control: null,
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: goBountyTask,

      ),
//      margin: EdgeInsets.only(top: 40.0,bottom: 40.0),
    );
  }
  Widget _swiperBuilder(BuildContext context, int index){

    Lb data = homeInfo.lb[index];
    return GestureDetector(
      onTap: (){
        NavigatorUtils.push(context, new AudioPlayPage(data.currid.toString(),data.id.toString()));
      },
      child: Image.network(homeInfo.lb[index].img,
        width: 180.0,
        height: 400.0,
        fit: BoxFit.fill,),
    );
  }
  void goBountyTask(int index){


  }
  Widget getRecommend(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin,left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
      child: Column(
        children: <Widget>[
      Container(
      padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
      child: Row(
        children: <Widget>[
          LinsUtils.getHeightLins(context,color: Colors.red,height: 20.0),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: DefaultValue.leftMargin),
              child: Text("每日推荐",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: DefaultValue.titleTextSize
                ),),
            ),
          ),
          Text("更多 >",
            style: TextStyle(
                color: Colors.grey,
                fontSize: DefaultValue.textSize
            ),)
        ],
      ),
    ),
          GestureDetector(
            onTap: (){
//              NavigatorUtils.push(context, new VideoPlayPage(homeInfo.jr[0].currid.toString(),homeInfo.jr[0].id.toString()));
            },
            child: Image.network(homeInfo.jr[0].hcover,height: 150.0,width: MediaQuery.of(context).size.width,fit: BoxFit.fill,),
          )
        ],
      ),
    );
  }
  Widget getFree(){
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
            child: Row(
              children: <Widget>[
                LinsUtils.getHeightLins(context,color: Colors.red,height: 20.0),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: Text("免费体验",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.titleTextSize
                      ),),
                  ),
                ),
                Text("更多 >",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: DefaultValue.textSize
                  ),)
              ],
            ),
          ),
          Container(
            height: 260.0,
            child: GridView.builder(
                itemCount: homeInfo.arr.length,
                controller: controller,
                //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                    crossAxisCount: 3,
                    //纵轴间距
                    mainAxisSpacing: 20.0,
                    //横轴间距
                    crossAxisSpacing: 10.0,
//            //子组件宽高长度比例
                    childAspectRatio: 0.6
                ),
                itemBuilder: (BuildContext context, int index) {
                  //Widget Function(BuildContext context, int index)
                  return getItemContainer(homeInfo.arr[index]);
                }),
          )
        ],
      ),
    );
  }
  Widget getItemContainer(Arr data){
    return GestureDetector(
      onTap: (){
        NavigatorUtils.push(context, new AudioPlayPage(data.currid.toString(),data.id.toString()));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(data.hcover,width: 100.0,height: 130.0,fit: BoxFit.fill,),
            Container(
              margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
              child: Text(data.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0
                ),),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("images/home01_mianfeitiyan_huo.png",width: 13.0,height: 15.0,),
                  Text("${data.clicks}人在学习",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: DefaultValue.smallTextSize
                    ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget getSleep(){
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
            child: Row(
              children: <Widget>[
                LinsUtils.getHeightLins(context,color: Colors.red,height: 20.0),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: Text("睡前故事",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.titleTextSize
                      ),),
                  ),
                ),
                Text("更多 >",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: DefaultValue.textSize
                  ),)
              ],
            ),
          ),
          Container(
            height: 260.0,
            child: GridView.builder(
                itemCount: homeInfo.re.length,
                controller: controller,
                //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                    crossAxisCount: 3,
                    //纵轴间距
                    mainAxisSpacing: 20.0,
                    //横轴间距
                    crossAxisSpacing: 10.0,
//            //子组件宽高长度比例
                    childAspectRatio: 0.6
                ),
                itemBuilder: (BuildContext context, int index) {
                  //Widget Function(BuildContext context, int index)
                  return getSleepItemContainer(homeInfo.re[index]);
                }),
          )
        ],
      ),
    );
  }
  Widget getSleepItemContainer(Re data){
    return GestureDetector(
      onTap: (){
        NavigatorUtils.push(context, new AudioPlayPage(data.currid.toString(),data.id.toString()));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(data.hcover,width: 100.0,height: 130.0,fit: BoxFit.fill,),
            Container(
              margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
              child: Text(data.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0
                ),),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("images/home01_mianfeitiyan_huo.png",width: 13.0,height: 15.0,),
                  Text("${data.clicks}人在学习",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: DefaultValue.smallTextSize
                    ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getCelebrity(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: DefaultValue.topMargin),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
            child: Row(
              children: <Widget>[
                LinsUtils.getHeightLins(context,color: Colors.red,height: 20.0),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: Text("名人传记",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.titleTextSize
                      ),),
                  ),
                ),
                Text("更多 >",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: DefaultValue.textSize
                  ),)
              ],
            ),
          ),
          Container(
            height: 480.0,
            child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: getRow,
                controller: controller,
                itemCount: homeInfo.sql.length,
                scrollDirection: Axis.vertical),
          )
        ],
      ),
    );
  }
  Widget getRow(BuildContext context,int index){
    Sql data = homeInfo.sql[index];
    return GestureDetector(
      onTap: (){
        NavigatorUtils.push(context, new AudioPlayPage(data.currid.toString(),data.id.toString()));
      },
      child: Container(
        height: 150.0,
        padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
        child: Row(
          children: <Widget>[
            Image.network(data.hcover,width: 102.0,height: 133.0,fit: BoxFit.fill,),
            Container(
              margin: EdgeInsets.only(left: DefaultValue.leftMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
                    child: Text(data.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0
                      ),),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
                      child: Text(data.words,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11.0
                        ),),
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset("images/home01_mianfeitiyan_huo.png",width: 13.0,height: 15.0,),
                        Text("${data.clicks}人在学习",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: DefaultValue.smallTextSize
                          ),)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget getPoetry(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: DefaultValue.topMargin),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
            child: Row(
              children: <Widget>[
                LinsUtils.getHeightLins(context,color: Colors.red,height: 20.0),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: Text("诗词经典",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.titleTextSize
                      ),),
                  ),
                ),
                Text("更多 >",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: DefaultValue.textSize
                  ),)
              ],
            ),
          ),
          Container(
            height: 480.0,
            child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: getPoetryRow,
                controller: controller,
                itemCount: homeInfo.sc.length,
                scrollDirection: Axis.vertical),
          )
        ],
      ),
    );
  }
  Widget getPoetryRow(BuildContext context,int index){
    Sc data = homeInfo.sc[index];
    return GestureDetector(
      onTap: (){
        NavigatorUtils.push(context, new AudioPlayPage(data.currid.toString(),data.id.toString()));
      },
      child: Container(
        height: 150.0,
        padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
        child: Row(
          children: <Widget>[
            Image.network(data.hvcover,width: 102.0,height: 133.0,fit: BoxFit.fill,),
            Container(
              margin: EdgeInsets.only(left: DefaultValue.leftMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
                    child: Text(data.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0
                      ),),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
                      child: Text(data.words,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11.0
                        ),),
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset("images/home01_mianfeitiyan_huo.png",width: 13.0,height: 15.0,),
                        Text("${data.id}人在学习",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: DefaultValue.smallTextSize
                          ),)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getIdiom(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: DefaultValue.topMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LinsUtils.getHeightLins(context,color: Colors.red,height: 20.0),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: Text("成语故事",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.titleTextSize
                      ),),
                  ),
                ),
                Text("更多 >",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: DefaultValue.textSize
                  ),)
              ],
            ),
          ),
          Container(
            height: 410.0,
            child: GridView.builder(
                itemCount: homeInfo.res.length,
                controller: controller,
                //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                    crossAxisCount: 2,
                    //纵轴间距
                    mainAxisSpacing: 20.0,
                    //横轴间距
                    crossAxisSpacing: 10.0,
//            //子组件宽高长度比例
                    childAspectRatio: 1.1
                ),
                itemBuilder: (BuildContext context, int index) {
                  //Widget Function(BuildContext context, int index)
                  return getIdiomItem(homeInfo.res[index]);
                }),
          )
        ],
      ),
    );
  }
  Widget getIdiomItem(Res data){
    return GestureDetector(
      onTap: (){
        NavigatorUtils.push(context, new AudioPlayPage(data.currid.toString(),data.id.toString()));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(data.hcover,width: 164.0,height: 110.0,fit: BoxFit.fill,),
            Container(
              margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: 4.0),
              child: Text(data.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0
                ),),
            ),
            Container(
              child: Text(data.words,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: DefaultValue.textSize
                ),),
            )
          ],
        ),
      ),
    );
  }
  Widget getMaster(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: DefaultValue.topMargin),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
            child: Row(
              children: <Widget>[
                LinsUtils.getHeightLins(context,color: Colors.red,height: 20.0),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: Text("大师来了",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.titleTextSize
                      ),),
                  ),
                ),
                Text("更多 >",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: DefaultValue.textSize
                  ),)
              ],
            ),
          ),
          Container(
            height: 600.0,
            child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: getMasterRow,
                controller: controller,
                itemCount: homeInfo.sql.length,
                scrollDirection: Axis.vertical),
          )
        ],
      ),
    );
  }
  Widget getMasterRow(BuildContext context,int index){
    Sql data = homeInfo.sql[index];
    return GestureDetector(
      onTap: (){
        NavigatorUtils.push(context, new VideoPlayPage(data.currid.toString(),data.id.toString()));
      },
      child: Container(
        height: 190.0,
        padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(data.hcover,width: MediaQuery.of(context).size.width,height: 113.0,fit: BoxFit.fill,),
            Container(
              margin: EdgeInsets.only(top: DefaultValue.topMargin),
              child: Text(data.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0
                ),),
            ),
            Container(
              margin: EdgeInsets.only(top: 4.0),
              child: Text(data.words,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11.0
                ),),
            )
          ],
        ),
      ),
    );
  }

}

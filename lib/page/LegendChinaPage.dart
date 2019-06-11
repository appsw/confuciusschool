import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/model/AudioInfo.dart';
import 'package:confuciusschool/page/AudioPlayPage.dart';
import 'package:confuciusschool/page/NewsPage.dart';
import 'package:confuciusschool/page/SearchPage.dart';
import 'package:confuciusschool/page/SearchResultAudioListPage.dart';
import 'package:confuciusschool/page/SearchResultListPage.dart';
import 'package:confuciusschool/page/SignInPage.dart';
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
//      ToastUtil.makeToast(msg);
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
    double topPadding = MediaQuery.of(context).padding.top;
    return Container(
      margin: EdgeInsets.only(top: topPadding),
      color: Colors.white,
      padding: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin,left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 0,
            child: GestureDetector(
              child: Image.asset("images/home01_qiandao.png",width: 25.0,height: 20.0,),
              onTap: (){
                NavigatorUtils.push(context, SignInPage());
              },
            )
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              child: Container(
                height: 28.0,
                margin: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
                decoration: new BoxDecoration(
                    border: new Border.all(width: 1.0,color:ColorsUtil.HerdBg ),
                    color: ColorsUtil.HerdBg,
                    borderRadius:  new BorderRadius.all(Radius.circular(20.0))
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                      child: Image.asset("images/home01_search.png",width: 15.0,height: 15.0,),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                      child: Text("请输入关键字、音频名称",
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
              child: Image.asset("images/home01_xiaoxi.png",width: 25.0,height: 20.0,),
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
      padding: EdgeInsets.only(top: 20.0),
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
      height: 160.0,
      color: Colors.white,
      alignment: Alignment.topCenter,
      child: Swiper(
        itemBuilder: _swiperBuilder,
        itemCount: homeInfo.lb.length,
        pagination: new SwiperPagination(),
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
        NavigatorUtils.push(context, new AudioPlayPage(data.currid.toString(),data.pid.toString(),1));
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
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
              child: Row(
                children: <Widget>[
                  LinsUtils.getHeightLins(context,color: Colors.red,height: 20.0,width: 2.0),
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
            onTap: (){
              NavigatorUtils.push(context, new SearchResultAudioListPage(0));
            },
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: (){
                    NavigatorUtils.push(context, new AudioPlayPage(homeInfo.jr[0].currid.toString(),homeInfo.jr[0].id.toString(),1));
                  },
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Image.network(homeInfo.jr[0].hcover,height: 67.0,width: 200.0,fit: BoxFit.fill,),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: DefaultValue.rightMargin),
                          height: 67.0,
                          child: Image.asset("images/bofang.png",width: 45.0,height: 45.0,),
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(right: DefaultValue.leftMargin),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: (){
                    NavigatorUtils.push(context, new AudioPlayPage(homeInfo.jr[1].currid.toString(),homeInfo.jr[1].id.toString(),1));
                  },
                  child: Container(
                      child: Stack(
                        children: <Widget>[
                          Image.network(homeInfo.jr[1].hcover,height: 67.0,width: 200.0,fit: BoxFit.fill,),
                          Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: DefaultValue.rightMargin),
                            height: 67.0,
                            child: Image.asset("images/bofang.png",width: 45.0,height: 45.0,),
                          )
                        ],
                      ),
                      margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                    )
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
  Widget getFree(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: DefaultValue.topMargin),
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin),
              child: Row(
                children: <Widget>[
                  LinsUtils.getHeightLins(context,color: Colors.red,height: 20.0,width: 2.0),
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
            onTap: (){
              NavigatorUtils.push(context, new SearchResultAudioListPage(0));
            },
          )
          ,
          Container(
            height: 170.0,
            padding: EdgeInsets.only(left: 6,right: 6),
            child: ListView.builder(
                itemCount: homeInfo.arr.length,
                controller: controller,
                padding: EdgeInsets.only(top: DefaultValue.topMargin),
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
//                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                  //横轴元素个数
//                    crossAxisCount: 1,
//                    //纵轴间距
//                    mainAxisSpacing: 20.0,
//                    //横轴间距
//                    crossAxisSpacing: 10.0,
////            //子组件宽高长度比例
//                    childAspectRatio: 0.6
//                ),
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
        NavigatorUtils.push(context, new AudioPlayPage(data.currid.toString(),data.id.toString(),1));
      },
      child: Container(
        margin: EdgeInsets.only(left: 6.0,right: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(data.hcover,width: 140.0,height: 92.0,fit: BoxFit.fill,),
            Container(
              margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
              width: 140.0,
              child: Text(data.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0
                ),),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("images/home01_mianfeitiyan_huo.png",width: 13.0,height: 15.0,),
                  Container(
                    padding: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: Text("${data.clicks}人在学习",
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: DefaultValue.smallTextSize
                      ),),
                  )

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
      margin: EdgeInsets.only(top: DefaultValue.topMargin),
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin),
              child: Row(
                children: <Widget>[
                  LinsUtils.getHeightLins(context,color: Colors.red,height: 20.0,width: 2.0),
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
            onTap: (){
              NavigatorUtils.push(context, new SearchResultAudioListPage(0));
            },
          )
          ,
          Container(
            height: 200.0,
            child: GridView.builder(
                itemCount: homeInfo.re.length,
                padding: EdgeInsets.only(top: DefaultValue.topMargin),
                physics: NeverScrollableScrollPhysics(),
                controller: controller,
                //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                    crossAxisCount: 3,
                    //纵轴间距
                    mainAxisSpacing: 0.0,
                    //横轴间距
                    crossAxisSpacing: 2.0,
//            //子组件宽高长度比例
                    childAspectRatio: 0.7
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
        NavigatorUtils.push(context, new AudioPlayPage(data.currid.toString(),data.id.toString(),1));
      },
      child: Container(
        margin: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(data.hcover,height: 129.0,fit: BoxFit.fill,),
            Container(
              margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
              child: Text(data.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0
                ),),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("images/home01_mianfeitiyan_huo.png",width: 13.0,height: 15.0,),
                  Container(
                    padding: EdgeInsets.only(left: DefaultValue.leftMargin),
                    child: Text("${data.clicks}人在学习",
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: DefaultValue.smallTextSize
                      ),),
                  )

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
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin),
              child: Row(
                children: <Widget>[
                  LinsUtils.getHeightLins(context,color: Colors.red,height: 20.0,width: 2.0),
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
            onTap: (){
              NavigatorUtils.push(context, new SearchResultAudioListPage(0));
            },
          )
          ,
          Container(
            height: 460.0,
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: DefaultValue.topMargin),
                physics: NeverScrollableScrollPhysics(),
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
        NavigatorUtils.push(context, new AudioPlayPage(data.currid.toString(),data.id.toString(),1));
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
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
                      child: Text(data.words,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11.0
                        ),),
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset("images/home01_mianfeitiyan_huo.png",width: 13.0,height: 15.0,),
                        Container(
                          padding: EdgeInsets.only(left: DefaultValue.leftMargin),
                          child: Text("${data.clicks}人在学习",
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: DefaultValue.smallTextSize
                            ),),
                        )

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
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin),
              child: Row(
                children: <Widget>[
                  LinsUtils.getHeightLins(context,color: Colors.red,height: 20.0,width: 2.0),
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
            onTap: (){
              NavigatorUtils.push(context, new SearchResultAudioListPage(0));
            },
          ),
          Container(
            height: 460.0,
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: DefaultValue.topMargin),
                physics: NeverScrollableScrollPhysics(),
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
        NavigatorUtils.push(context, new AudioPlayPage(data.currid.toString(),data.id.toString(),1));
      },
      child: Container(
        height: 150.0,
        padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
        child: Row(
          children: <Widget>[
            Image.network("${data.hcover}",width: 102.0,height: 133.0,fit: BoxFit.fill,),
            Container(
              margin: EdgeInsets.only(left: DefaultValue.leftMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
                    child: Text(data.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
                      child: Text(data.words,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11.0
                        ),),
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset("images/home01_mianfeitiyan_huo.png",width: 13.0,height: 15.0,),
                        Container(
                          padding: EdgeInsets.only(left: DefaultValue.leftMargin),
                          child: Text("${data.id}人在学习",
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: DefaultValue.smallTextSize
                            ),),
                        )

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
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LinsUtils.getHeightLins(context,color: Colors.red,height: 20.0,width: 2.0),
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
            onTap: (){
              NavigatorUtils.push(context, new SearchResultAudioListPage(0));
            },
          ),
          Container(
            height: 350.0,
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
            child: GridView.builder(
                itemCount: homeInfo.res.length,
                padding: EdgeInsets.only(top: DefaultValue.topMargin),
                physics: NeverScrollableScrollPhysics(),
                controller: controller,
                //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                    crossAxisCount: 2,
                    //纵轴间距
                    mainAxisSpacing: 0.0,
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
        NavigatorUtils.push(context, new AudioPlayPage(data.currid.toString(),data.id.toString(),1));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(data.hcover,width: 300.0,height: 110.0,fit: BoxFit.fill,),
            Container(
              child: Text(data.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0
                ),),
            ),
            Container(
              child: Text(data.words,
                maxLines: 1,
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
        NavigatorUtils.push(context, new VideoPlayPage(data.currid.toString(),data.id.toString(),1));
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
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0
                ),),
            ),
            Container(
              margin: EdgeInsets.only(top: 4.0),
              child: Text(data.words,
                maxLines: 1,
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

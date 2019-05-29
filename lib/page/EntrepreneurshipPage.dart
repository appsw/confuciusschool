import 'package:chewie/chewie.dart';
import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/model/EntrepreneurialTitleInfo.dart';
import 'package:confuciusschool/model/EntrepreneurshipInfo.dart';
import 'package:confuciusschool/page/EntrepreneurCommentPage.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';
class EntrepreneurshipPage extends StatefulWidget {
  @override
  _EntrepreneurshipPageState createState() => _EntrepreneurshipPageState();
}

class _EntrepreneurshipPageState extends BaseState {
  var tableNames = ["创业加盟","代理内训"];
  var tabNumber = 0;
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  var playerWidget;
  EntrepreneurshipInfo data;
  int typea;
  EntrepreneurialTitleInfo entrepreneurialTitleInfo;
  ScrollController scrollController = new ScrollController();
  void initVideo(String url){
    videoPlayerController = VideoPlayerController.network(url);

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: false,
      looping: true,
    );

    playerWidget = Chewie(
      controller: chewieController,
    );
  }
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    getEntreneurTitle();
  }
  void getEntreneurTitle(){
    api.getEntrepreneurialTitle((data){
      setState(() {
        this.entrepreneurialTitleInfo = data;

      });
      getEntreneurInfo(entrepreneurialTitleInfo.sql[tabNumber].id.toString());
    }, (msg){
//      ToastUtil.makeToast(msg);
    });
  }

  void getEntreneurship(){
    api.getEntrepreneurship((data){
      setState(() {
        this.data = data;

      });
      if(data != null)
        initVideo(data.re.address);
    }, (msg){
      ToastUtil.makeToast(msg);
    });
  }
  void getEntreneurInfo(String id){
    api.getEntrepreneurInfo(id,(data){
      setState(() {
        this.data = data;
        typea = this.data.status;
      });
      if(data != null)
        initVideo(data.re.address);
    }, (msg){
//      ToastUtil.makeToast(msg);
    });
  }
  void getAgent(){
    api.getAgent((data){
      setState(() {
        this.data = data;

      });
      if(data != null)
        initVideo(data.re.address);
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
    return data == null ? LoadingUtils.getRingLoading() : SingleChildScrollView(
      controller: scrollController,
      child: Container(
        child: Column(
          children: <Widget>[
            getTables(context),
            getVideo(),
            Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("目录",style: TextStyle(color:Colors.red,
                  fontSize: 15.0),),
                  Container(
                    color: Colors.red,
                    width: 40.0,
                    height: 1.0,
                    margin: EdgeInsets.only(top: DefaultValue.topMargin),
                  ),
                  LinsUtils.getWidthLins(context)
                ],
              ),
              padding: EdgeInsets.only(top: DefaultValue.topMargin,left: DefaultValue.leftMargin),
            ),
            getCatalog(),
            getComment()
          ],
        ),
      ),
    );
  }
  Widget getCatalog(){
    return Container(
      height: MediaQuery.of(context).size.height - 440.0,
      color: Colors.white,
      child: ListView.builder(
          shrinkWrap: true,
          controller: scrollController,
          itemBuilder: getRow,
          itemCount: data.res.length,
          scrollDirection: Axis.vertical),
    );
  }
  Widget getRow(BuildContext context,int index){
    Res sql = data.res[index];
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 5.0),
                        child: Row(
                          children: <Widget>[
                            Text(sql.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0
                              ),),
                          ],
                        ),
                      ),
                      Text("时长：${sql.duration}",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: DefaultValue.textSize
                        ),)
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 5.0),
                        child: Row(
                          children: <Widget>[
                            Text("${sql.clicks}人已学习",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: DefaultValue.textSize
                              ),),
                          ],
                        ),
                      ),
                      Text("${sql.createTime}",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: DefaultValue.textSize
                        ),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        LinsUtils.getWidthLins(context)
      ],
    );
  }
  Widget getVideo(){

    return Container(
      child: playerWidget,
    );
  }
  Widget getTables(BuildContext context){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(flex: 1,child: GestureDetector(child: getTab(0),onTap: (){onClickTable(0);},),),
          Expanded(flex: 1,child:  GestureDetector(child: getTab(1),onTap: (){onClickTable(1);},),),
          Expanded(flex: 1,child: GestureDetector(child: getTab(2),onTap: (){onClickTable(2);},),),
          Expanded(flex: 1,child:  GestureDetector(child: getTab(3),onTap: (){onClickTable(3);},),),

        ],
      ),
    );
  }
  Widget getTab(var tabNo){
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(entrepreneurialTitleInfo.sql[tabNo].name,style: TextStyle(color: tabNo == tabNumber ? Colors.red : Colors.black,
          fontSize: 15.0),),
          getLins(context, tabNo,80.0)
        ],
      ),
      padding: EdgeInsets.only(top: DefaultValue.topMargin),
    );
  }
  Widget getLins(BuildContext context,var tabNo,var width){
    return Container(
      color: tabNo == tabNumber ? Colors.red : Colors.transparent,
      width: width == 0 ? MediaQuery.of(context).size.width : width,
      height: 1.0,
      margin: EdgeInsets.only(top: DefaultValue.topMargin),
    );
  }
  void onClickTable(var tabNo){

    setState(() {
      tabNumber = tabNo;

    });
    getEntreneurInfo(entrepreneurialTitleInfo.sql[tabNo].id.toString());
//    if(tabNo == 0){
//      getAgent();
//    }else{
//      getEntreneurship();
//    }
  }
  Widget getComment(){

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120.0,
      alignment: Alignment.centerRight,
      color: Colors.white,
      child: Container(
        width: 36.0,
        height: 100.0,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              child: typea == 1 ? Image.asset("images/home03_dianzan.png",width: 18.0,height: 20.0,color: Colors.red,) : Image.asset("images/home03_dianzan.png",width: 18.0,height: 20.0,color: Colors.grey,),
              onTap: (){
                var type = "1";
                if(typea == 1)
                  type = "2";
                api.putEntrepreneurshipGood(data.re.id.toString(), "3", type, (msg){
                  ToastUtil.makeToast(msg);
                  if(typea == 1){
                    setState(() {
                      typea = 2;
                    });
                  }else{
                    setState(() {
                      typea = 1;
                    });
                  }
                  print(typea);
                }, (msg){
                  ToastUtil.makeToast(msg);
                });
              },
            ),
            Text("点赞"),
            GestureDetector(
              child: Image.asset("images/home03_pinglun.png",width: 18.0,height: 20.0,),
              onTap: (){
                NavigatorUtils.push(context, new EntrepreneurCommentPage(data.re.id.toString()));
              },
            ),
            Text("评论"),
          ],
        ),
      ),
    );
  }
}
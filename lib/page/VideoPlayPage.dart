import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/model/IntroductionInfo.dart';
import 'package:confuciusschool/model/VideoInfo.dart';
import 'package:confuciusschool/page/CommentPage.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_html/flutter_html.dart';

class VideoPlayPage extends StatefulWidget {
  String currid;
  String id;
  VideoPlayPage(this.currid,this.id);
  @override
  _VideoPlayPageState createState() => _VideoPlayPageState(this.currid,this.id);
}
class _VideoPlayPageState extends BaseState<VideoPlayPage> {
  String currid;
  String id;
  VideoInfo data;
  IntroductionInfo introductionInfo;
  _VideoPlayPageState(this.currid,this.id);
  var tableNames = ["简介","目录","图文"];
  var tabNumber = 1;
  VideoPlayerController videoPlayerController;

  ChewieController chewieController;

  var playerWidget;

  var videoText;
  void initVideo(String url){
    videoPlayerController = VideoPlayerController.network(url);

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
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
    api.getVideoDetail(currid, id, (data){
      setState(() {
        this.data = data;

      });
      if(data != null)
      initVideo(data.re.address);
    }, (msg){
      ToastUtil.makeToast(msg);
    });
    api.getVideoIntroduction(currid, (data){
      setState(() {
        this.introductionInfo = data;
      });

    }, (msg){
      ToastUtil.makeToast(msg);
    });
    api.getVideoText(currid, (data){
      setState(() {
        videoText = data;
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
    return (data == null || introductionInfo == null || videoText == null )? LoadingUtils.getRingLoading() : Container(
      child: Column(
        children: <Widget>[
          getVideo(),
          getTables(context),
          getBottomBody()
        ],
      ),
    );
  }
  Widget getVideo(){

    return Container(
      child: playerWidget,
    );
  }
  Widget getBottomBody(){
    switch(tabNumber){
      case 0:
        return getIntroduction();
        break;
      case 1:
        return getCatalog();
        break;
      case 2:
        return getText();
        break;
    }
  }
  Widget getIntroduction(){
    return Container(
      height: MediaQuery.of(context).size.height - 370.0,
      color: Colors.white,
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: getIntroductionRow,
          itemCount: introductionInfo.brief.length,
          scrollDirection: Axis.vertical),
    );
  }
  Widget getIntroductionRow(BuildContext context,int index){
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
      child: Container(
        child: Image.network(introductionInfo.brief[index],width: MediaQuery.of(context).size.width,),
      ),
    );
  }
  Widget getCatalog(){
    return Container(
      height: MediaQuery.of(context).size.height - 370.0,
      color: Colors.white,
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: getRow,
          itemCount: data.sql.length,
          scrollDirection: Axis.vertical),
    );
  }
  Widget getRow(BuildContext context,int index){
    Sql sql = data.sql[index];
    return Container(
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
                          fontSize: DefaultValue.titleTextSize
                        ),),
                        getLabel(sql.level)
                      ],
                    ),
                  ),
                  Text("时长${sql.duration}",
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
    );
  }
  Widget getText(){

    return Container(
      height: MediaQuery.of(context).size.height - 370.0,
      child: ListView(
        children: <Widget>[
          Container(
            child: Html(
              data: videoText,
              //Optional parameters:
              padding: EdgeInsets.all(8.0),
              backgroundColor: Colors.white70,
              defaultTextStyle: TextStyle(fontFamily: 'serif'),
              linkStyle: const TextStyle(
                color: Colors.redAccent,
              ),
              onLinkTap: (url) {
                // open url in a webview
              },
            ),
          )
        ],
      ),
    );
  }
  @override
  Widget getBottomNavigationBar(BuildContext context) {
    // TODO: implement getBottomNavigationBar
    return data == null ? Container() : Container(
      height: 50.0,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("images/all_back.png",width: 10.0,height: 20.0,),
                    Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child: Text("返回",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: DefaultValue.textSize
                        ),),
                    )

                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                NavigatorUtils.push(context, new CommentPage(id));
              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("images/home01_5kanshipin_pinglun.png",width: 20.0,height: 20.0,),
                    Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child: Text(data.re.comment.toString(),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: DefaultValue.textSize
                        ),),
                    )

                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("images/home01_5kanshipin_shoucang_xuanzhong.png",width: 20.0,height: 20.0,),
                    Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child: Text(data.re.collection.toString(),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: DefaultValue.textSize
                        ),),
                    )

                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("images/home01_5kanshipin_dianzan.png",width: 20.0,height: 20.0,),
                    Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child: Text(data.re.fabulous.toString(),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: DefaultValue.textSize
                        ),),
                    )

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget getTables(BuildContext context){
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(flex: 1,child: GestureDetector(child: getTab(0),onTap: (){onClickTable(0);},),),
          Expanded(flex: 1,child:  GestureDetector(child: getTab(1),onTap: (){onClickTable(1);},),),
          Expanded(flex: 1,child:  GestureDetector(child: getTab(2),onTap: (){onClickTable(2);},),),
        ],
      ),
    );
  }
  Widget getTab(var tabNo){
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(tableNames[tabNo],style: TextStyle(color: tabNo == tabNumber ? Colors.red : Colors.black),),
          getLins(context, tabNo,40.0)
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


  }
  Widget getLabel(int type){
    var text;
    var color;
    switch(type){
      case 1:
        text = "免费";
        color =ColorsUtil.LabelYellowBg;
        break;
      case 2:
        text = "vip";
        color =ColorsUtil.LabelRedBg;
        break;
      case 3:
        text = "总代";
        color =ColorsUtil.LabelRedBg;
        break;
      case 4:
        text = "独立购买";
        color =ColorsUtil.LabelRedBg;
        break;
    }
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: DefaultValue.rightMargin),
      padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 2.0,bottom: 2.0),
      decoration: new BoxDecoration(
          color: color,
          borderRadius:  new BorderRadius.all(Radius.circular(4.0))
      ),
      child: Text(text,
        style: TextStyle(
            color: Colors.white,
            fontSize: DefaultValue.smallTextSize
        ),),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();

    chewieController.dispose();
  }


}

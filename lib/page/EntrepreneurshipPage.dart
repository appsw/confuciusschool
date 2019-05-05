import 'package:chewie/chewie.dart';
import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/model/EntrepreneurshipInfo.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
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
    getEntreneurship();
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
    return data == null ? LoadingUtils.getRingLoading() : Container(
      child: Column(
        children: <Widget>[
          getTables(context),
          getVideo(),
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("目录",style: TextStyle(color:Colors.red),),
                Container(
                  color: Colors.red,
                  width: 40.0,
                  height: 1.0,
                  margin: EdgeInsets.only(top: DefaultValue.topMargin),
                )
              ],
            ),
            padding: EdgeInsets.only(top: DefaultValue.topMargin,left: DefaultValue.leftMargin),
          ),
          getCatalog()
        ],
      ),
    );
  }
  Widget getCatalog(){
    return Container(
      height: MediaQuery.of(context).size.height - 440.0,
      color: Colors.white,
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: getRow,
          itemCount: data.res.length,
          scrollDirection: Axis.vertical),
    );
  }
  Widget getRow(BuildContext context,int index){
    Res sql = data.res[index];
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
    if(tabNo == 0){
      getAgent();
    }else{
      getEntreneurship();
    }


  }
}
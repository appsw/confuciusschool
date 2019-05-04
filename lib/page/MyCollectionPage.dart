import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/dialog/LoadingDialog.dart';
import 'package:confuciusschool/model/Classification.dart';
import 'package:confuciusschool/model/MyCollectionInfo.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class MyCollectionPage extends StatefulWidget {
  @override
  _MyCollectionPageState createState() => _MyCollectionPageState();
}

class _MyCollectionPageState extends BaseState {

  List<Classification> data;
  var tableNames = ["国学+","中国故事","智慧超市"];
  var tabNumber = 0;
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    getData(0);
  }
  void getData(int status){
    LoadingDialog.showLoadingDialog(context);
    var type;
    if(status == 0)
      type = "";
    else
      type = status.toString();
    api.getMyCollection(type, (data){
      setState((){
        this.data = data;
      });
      LoadingDialog.dismissLoadingDialog(context);
    }, (msg){
      LoadingDialog.dismissLoadingDialog(context);
      ToastUtil.makeToast(msg);
    });
  }

  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "我的收藏");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return data == null ? LoadingUtils.getRingLoading() : Container(
      child: Column(
        children: <Widget>[
          getTables(context),
          getList()
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
      data.clear();
    });
    getData( tabNo);
  }
  Widget getList(){

    return Container(
      height: MediaQuery.of(context).size.height - 130.0,
      color: Colors.white,
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: getRow,
          itemCount: data.length,
          scrollDirection: Axis.vertical),
    );
  }
  Widget getRow(BuildContext context,int index){
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.network(data[index].fcover,width: 150.0,height: 105.0,fit: BoxFit.fill,),
          Container(
            height: 145.0,
            margin: EdgeInsets.only(left: DefaultValue.leftMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    getLabel(data[index].level),
                    Text(data[index].name.length > 8 ? data[index].name.substring(0,8): data[index].name,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.titleTextSize
                      ),)
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: DefaultValue.topMargin),
                  child: Text(data[index].words == null? "" : data[index].words,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: DefaultValue.textSize
                    ),),
                ),
                Container(
                  margin: EdgeInsets.only(top: DefaultValue.topMargin),
                  child: Text("讲师：${data[index].lecturer}",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: DefaultValue.textSize
                    ),),
                ),
                Container(
                  margin: EdgeInsets.only(top: DefaultValue.topMargin),
                  width: 200.0,
                  child: Row(
                    children: <Widget>[
                      Image.asset("images/home01_mianfeitiyan_huo.png",width: 13.0,height: 15.0,),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                          child: Text("${data[index].clicks}人在学习",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: DefaultValue.smallTextSize
                            ),),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: DefaultValue.rightMargin),
                        child: Text(data[index].createTime,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: DefaultValue.smallTextSize
                          ),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
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
      margin: EdgeInsets.only(right: DefaultValue.rightMargin),
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
}

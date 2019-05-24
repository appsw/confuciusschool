import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/model/ActivityInfo.dart';
import 'package:confuciusschool/page/ActivityDetailsPage.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class ActivityCenterPage extends StatefulWidget {
  @override
  _ActivityCenterPageState createState() => _ActivityCenterPageState();
}

class _ActivityCenterPageState extends BaseState {

  ActivityInfo data;
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    api.getActivities((data){
      setState(() {
        this.data = data;
      });
    }, (msg){
      ToastUtil.makeToast(msg);
    });
  }
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "活动中心");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return data == null ? LoadingUtils.getRingLoading() : Container(
      child: getList(),
    );
  }
  Widget getList(){
    return Container(
      height: MediaQuery.of(context).size.height - 0.0,
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
    return GestureDetector(
      onTap: (){
        NavigatorUtils.push(context, ActivityDetailsPage(sql.id));
      },
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network("${sql.img}",width: 350.0,height: 140.0,fit: BoxFit.fill,),
                  Container(
                    margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
                    child: Text(sql.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.titleTextSize
                      ),),
                  ),
                ],
              )
          ),
          LinsUtils.getWidthLins(context)
        ],
      )
    );
  }
}

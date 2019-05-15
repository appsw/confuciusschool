import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/model/NewsInfo.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:flutter/material.dart';

class NewsDetailPage extends StatefulWidget {
  NewsInfo data;
  NewsDetailPage(this.data);
  @override
  _NewsDetailPageState createState() => _NewsDetailPageState(data);
}

class _NewsDetailPageState extends BaseState {

  NewsInfo data;
  _NewsDetailPageState(this.data);
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "消息详情");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
      child: Text("${data.about}",
      style: TextStyle(
        color: Colors.black,
        fontSize: DefaultValue.textSize
      ),),
    );
  }
}

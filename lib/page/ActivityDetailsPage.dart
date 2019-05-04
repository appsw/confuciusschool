import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/model/ActivityDetailsInfo.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class ActivityDetailsPage extends StatefulWidget {
  int id;
  ActivityDetailsPage(this.id);
  @override
  _ActivityDetailsPageState createState() => _ActivityDetailsPageState(id);
}

class _ActivityDetailsPageState extends BaseState {

  int id;
  _ActivityDetailsPageState(this.id);
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    api.getActivitiesDetails(id.toString(),(data){
      setState(() {
        this.data = data;
      });
    }, (msg){
      ToastUtil.makeToast(msg);
    });
  }
  ActivityDetailsInfo data;
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "活动详情");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("${data.sql.title}",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: DefaultValue.titleTextSize
              ),),
            Text("${data.sql.explain}",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: DefaultValue.textSize
              ),),
            Image.network("${data.sql.img}",width: MediaQuery.of(context).size.width,)
          ],
        ),
      ),
    );
  }

}

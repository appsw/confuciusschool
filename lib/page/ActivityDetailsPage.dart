import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/model/ActivityDetailsInfo.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

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
    return data == null ? LoadingUtils.getRingLoading() : Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Html(
        data: data.uedtext,
        //Optional parameters:
        backgroundColor: Colors.white70,
        defaultTextStyle: TextStyle(fontFamily: 'serif'),
        linkStyle: const TextStyle(
          color: Colors.redAccent,
        ),
        onLinkTap: (url) {
          // open url in a webview
        },
      ),
    );
  }

}

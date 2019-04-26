import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewsPage extends BasefulWidget{
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "我的消息");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return null;
  }
  
}
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutPage extends BasefulWidget{
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "关于我们");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return null;
  }

}
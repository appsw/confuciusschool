import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class RegistAgreementPage extends StatefulWidget {
  @override
  _RegistAgreementPageState createState() => _RegistAgreementPageState();
}

class _RegistAgreementPageState extends BaseState {
  var text;
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    api.getRegistAgreement((data){
      setState(() {
        this.text = data;
      });
    }, (msg){ToastUtil.makeToast(msg);});
  }

  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "用户协议");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
        child: Text("${text}",
          style: TextStyle(
              color: Colors.black,
              fontSize: DefaultValue.textSize
          ),),
      ),
    );
  }
}

import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends BaseState {

  var controller = TextEditingController();
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "意见反馈");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          getEdit(),
          getBtn()
        ],
      ),
    );
  }
  Widget getEdit(){
    return Container(
      margin: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
      padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
      color: ColorsUtil.GreyDialogBg,
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      child: TextField(
        controller: controller,
        maxLines: 9,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(2.0),
          border: InputBorder.none,
          hintText: '请填写您要对我们说的话',
          prefixStyle: new TextStyle(height: 20.0),
          hintStyle: new TextStyle(color: Colors.grey,fontSize: DefaultValue.messageTextSize),
        ),
      ),
    );
  }
  Widget getBtn(){
    return Container(
      margin: EdgeInsets.only(top: 300.0),
      child: FlatButton(
        onPressed: (){
          var text = controller.text;

          if(text.isEmpty){
            ToastUtil.makeToast("请输入意见！");
            return;
          }
          putFeed(text);

          print('点击3333333333333333333333333333333333333333333333333333333333333333333333333333333');
        },
        color: ColorsUtil.LogBtnBg,//按钮的背景颜色
        padding: EdgeInsets.only(top:10.0,bottom: 10.0,left: 136.0,right: 136.0),//按钮距离里面内容的内边距
        child: new Text('提交',style: TextStyle(fontSize: DefaultValue.loginBtnSize),),
        textColor: Colors.white,//文字的颜色
        textTheme:ButtonTextTheme.normal ,//按钮的主题
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
  void putFeed(String text){
    api.putFeed(text, (msg){
      ToastUtil.makeToast(msg);
      Navigator.pop(context);
    }, (msg){
      ToastUtil.makeToast(msg);
    });
  }
}

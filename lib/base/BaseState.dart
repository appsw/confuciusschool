
import 'package:confuciusschool/httputils/Api.dart';
import 'package:confuciusschool/utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class BaseState<T> extends State<StatefulWidget>{
  Api _api;

  Api get api => _api;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    onCreate(context);
    return Scaffold(
      appBar: getAppBar(context),
      body: getBody(context),
      bottomNavigationBar: getBottomNavigationBar(context),
      resizeToAvoidBottomPadding: false,
    );
  }
  @protected
  Widget getAppBar(BuildContext context);

  @protected
  Widget getBody(BuildContext context);

  Widget getBottomNavigationBar(BuildContext context){}

  //  绘制页面之前，不耗时的操作
  void onCreate(BuildContext context) {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initApi();
  }

  void initApi(){
    Constant.getToken().then((token){
      _api = new Api(TOKEN: token);
      initData();
    });
  }
  void initData(){

  }


}
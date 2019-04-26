import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:confuciusschool/httputils/Api.dart';
import 'package:confuciusschool/utils/Constant.dart';

abstract class BasefulWidget extends StatefulWidget {
  State<BasefulWidget> state;
  Api api;
  BuildContext context;

  @override
  createState() => _BasefulWidgetState();

  @protected
  Widget getAppBar(BuildContext context);

  @protected
  Widget getBody(BuildContext context);

  Widget getBottomNavigationBar(BuildContext context){}

//  绘制页面之前，不耗时的操作
  void onCreate(BuildContext context) {}

//  绘制页面之后，耗时的操作（网络、文件）
  void initState() {}

  void dispose(){}

  void initApi(){
    Constant.getToken().then((token){
      api = new Api(TOKEN: token);
      initState();
    });
  }
  void setState(var fun){
    state.setState(fun);
  }

}

class _BasefulWidgetState extends State<BasefulWidget> {
  @override
  void initState() {
    super.initState();
    widget.initApi();

  }

  @override
  Widget build(BuildContext context) {
    widget.state = this;
    widget.context = context;
    widget.onCreate(context);
    return Scaffold(
      appBar: widget.getAppBar(context),
      body: widget.getBody(context),
      bottomNavigationBar: widget.getBottomNavigationBar(context),
      resizeToAvoidBottomPadding: false,
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.dispose();
  }

}
import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/dialog/LoadingDialog.dart';
import 'package:confuciusschool/model/Classification.dart';
import 'package:confuciusschool/page/SearchPage.dart';
import 'package:confuciusschool/page/VideoPlayPage.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
class SearchResultListPage extends StatefulWidget {
  var tabNumber;
  SearchResultListPage(this.tabNumber);
  @override
  _SearchResultListPageState createState() => _SearchResultListPageState(tabNumber);
}

class _SearchResultListPageState extends BaseState {

  _SearchResultListPageState(this.tabNumber);
  List<Classification> data = [];
  var tableNames = ["全部","国文","国艺","国礼","国医"];
  var tabNumber;
  String _selectedValue = "1";
  final controller = TextEditingController();

  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    getData(tabNumber);
  }
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return null;
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          getHead(),
          getTables(context),
          getList()
        ],
      ),
    );
  }
  Widget getHead(){
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      height: 50.0,
      padding: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin,left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 0,
            child: GestureDetector(
              child: Image.asset("images/all_back.png",width: 10.0,height: 18.0,),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                height: 38.0,
              padding: EdgeInsets.only(top: 4.0,bottom: 4.0,left: 4.0,right: 4.0),
              margin: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
                decoration: new BoxDecoration(
                    border: new Border.all(width: 1.0,color:ColorsUtil.HomeAppBarBg ),
                    color: ColorsUtil.HomeAppBarBg,
                    borderRadius:  new BorderRadius.all(Radius.circular(20.0))
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                      child: Image.asset("images/home01_search.png"),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                        height: 20.0,
                        child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2.0),
                            border: InputBorder.none,
                            hintText: '请输入关键字、视频名称',
                            prefixStyle: new TextStyle(height: 20.0),
                            hintStyle: new TextStyle(color: Colors.grey,fontSize: DefaultValue.messageTextSize),
                          ),
                          onSubmitted: (text){
                            getSeachData(text,tabNumber);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
            flex: 0,
            child: GestureDetector(
              child: Row(
                children: <Widget>[
                  Image.asset("images/home01_3_1fenleishaixuan_shaixuan.png"),
                  Container(
                    margin: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
                    child: Text("筛选",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: DefaultValue.textSize
                      ),),
                  ),
                ],
              ),
              onTap: (){
//                NavigatorUtils.push(context, new NewsPage());
                _showMenu(context);
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget getTables(BuildContext context){
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(flex: 1,child: GestureDetector(child: getTab(0),onTap: (){onClickTable(0);},),),
              Expanded(flex: 1,child:  GestureDetector(child: getTab(1),onTap: (){onClickTable(1);},),),
              Expanded(flex: 1,child:  GestureDetector(child: getTab(2),onTap: (){onClickTable(2);},),),
              Expanded(flex: 1,child:  GestureDetector(child: getTab(3),onTap: (){onClickTable(3);},),),
              Expanded(flex: 1,child:  GestureDetector(child: getTab(4),onTap: (){onClickTable(4);},),),
            ],
          ),
        ),
        LinsUtils.getWidthLins(context)
      ],
    );
  }
  Widget getTab(var tabNo){
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(tableNames[tabNo],style: TextStyle(color: tabNo == tabNumber ? Colors.red : Colors.black),),
          getLins(context, tabNo,40.0)
        ],
      ),
      padding: EdgeInsets.only(top: DefaultValue.topMargin),
    );
  }
  Widget getLins(BuildContext context,var tabNo,var width){
    return Container(
      color: tabNo == tabNumber ? Colors.red : Colors.transparent,
      width: width == 0 ? MediaQuery.of(context).size.width : width,
      height: 1.0,
      margin: EdgeInsets.only(top: DefaultValue.topMargin),
    );
  }
  void onClickTable(var tabNo){

    setState(() {
      tabNumber = tabNo;
      _selectedValue = "1";
      data.clear();
    });
    getData( tabNo);
  }
  void getData(int status){
    LoadingDialog.showLoadingDialog(context);
    var type;
    if(status == 0)
      type = "";
    else
      type = status.toString();
    api.getClassification(type,_selectedValue, (data){
      setState((){
        this.data = data;
      });
      LoadingDialog.dismissLoadingDialog(context);
    }, (msg){
      LoadingDialog.dismissLoadingDialog(context);
      ToastUtil.makeToast(msg);
    });
  }
  void getSeachData(String name,int status){
    LoadingDialog.showLoadingDialog(context);
    var type;
    if(status == 0)
      type = "";
    else
      type = status.toString();
    api.getSeachByName(_selectedValue, name,type, (data){
      setState((){
        this.data = data;
      });
      LoadingDialog.dismissLoadingDialog(context);
    }, (msg){
      LoadingDialog.dismissLoadingDialog(context);
      ToastUtil.makeToast(msg);
    });
  }
  Widget getList(){

    return Container(
      height: MediaQuery.of(context).size.height - 120.0,
      color: Colors.white,
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: getRow,
          itemCount: data.length,
          scrollDirection: Axis.vertical),
    );
  }
  Widget getRow(BuildContext context,int index){
    return GestureDetector(
      onTap: (){
        NavigatorUtils.push(context, new VideoPlayPage(data[index].currid.toString(),data[index].id.toString()));
      },
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.network(data[index].fcover,width: 120.0,height: 105.0,fit: BoxFit.fill,),
                Container(
                  height: 105.0,
                  margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          getLabel(data[index].level),
                          Text(data[index].name.length > 8 ? data[index].name.substring(0,8): data[index].name,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0
                            ),)
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: DefaultValue.topMargin),
                        child: Text(data[index].words == null? "" : data[index].words,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: DefaultValue.textSize
                          ),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: DefaultValue.topMargin),
                        child: Text("课程：${data[index].lecturer}",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: DefaultValue.textSize
                          ),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        width: 200.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Image.asset("images/home01_mianfeitiyan_huo.png",width: 13.0,height: 15.0,),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                                child: Text("${data[index].clicks}人在学习",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: DefaultValue.smallTextSize
                                  ),),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: DefaultValue.rightMargin),
                              child: Text(data[index].createTime,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: DefaultValue.smallTextSize
                                ),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          LinsUtils.getWidthLins(context)
        ],
      )
    );
  }
  Widget getLabel(int type){
    var text;
    var color;
    switch(type){
      case 1:
        text = "免费";
        color =ColorsUtil.LabelYellowBg;
        break;
      case 2:
        text = "vip";
        color =ColorsUtil.LabelRedBg;
        break;
      case 3:
        text = "总代";
        color =ColorsUtil.LabelRedBg;
        break;
      case 4:
        text = "独立购买";
        color =ColorsUtil.LabelRedBg;
        break;
    }
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: DefaultValue.rightMargin),
      padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: 2.0,bottom: 2.0),
      decoration: new BoxDecoration(
          color: color,
          borderRadius:  new BorderRadius.all(Radius.circular(4.0))
      ),
      child: Text(text,
        style: TextStyle(
            color: Colors.white,
            fontSize: DefaultValue.smallTextSize
        ),),
    );
  }


  PopupMenuButton _popMenu() {
    return PopupMenuButton<String>(
      itemBuilder: (context) => _getPopupMenu(context),
      onSelected: (String value) {
        print('onSelected');
        _selectValueChange(value);
      },
      onCanceled: () {
        print('onCanceled');
      },
//      child: RaisedButton(onPressed: (){},child: Text('选择'),),
      icon: Icon(Icons.shopping_basket),
    );
  }

  _selectValueChange(String value) {
    setState(() {
      _selectedValue = value;
    });
    if(controller.text == null)
      getData(tabNumber);
    else
      getSeachData(controller.text,tabNumber);
  }

  _showMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject();
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    final RelativeRect position = RelativeRect.fromLTRB(
      MediaQuery.of(context).size.width,70.0,0.0,0.0
    );

    var pop = _popMenu();
    showMenu<String>(
      context: context,
      items: pop.itemBuilder(context),
      position: position,
    ).then<String>(( newValue) {
      if (!mounted) return null;
      if (newValue == null) {
        if (pop.onCanceled != null) pop.onCanceled();
        return null;
      }
      print(newValue);
      _selectValueChange(newValue);
    });
  }

  _getPopupMenu(BuildContext context) {
    return <PopupMenuEntry<String>>[
      PopupMenuItem<String>(
        value: "1",
        child: Text('最新'),
      ),
      PopupMenuItem<String>(
        value: "2",
        child: Text('最热'),
      ),
      PopupMenuItem<String>(
        value: "3",
        child: Text('免费'),
      ),
    ];
  }
}
import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/model/MaterialInfo.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class MaterialPage extends StatefulWidget {
  @override
  _MaterialPageState createState() => _MaterialPageState();
}

class _MaterialPageState extends BaseState{

  List<MaterialInfo> data;
  final controller = TextEditingController();
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    api.getMaterialInfo((data){
      setState(() {
        this.data = data;
      });
    }, (msg){
      ToastUtil.makeToast(msg);
    });
  }

  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "经典素材");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return data == null ? LoadingUtils.getRingLoading() : Container(
      child: Column(
        children: <Widget>[
          getHead(),
          getList()
        ],
      ),
    );
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
    MaterialInfo materialInfo = data[index];
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getPersonal(materialInfo),
          getWords(materialInfo.mname),
          getTime(materialInfo.time),
          getBtn(),
          LinsUtils.getWidthLins(context,height: 10.0)
        ],
      ),
    );
  }
  Widget getBtn(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: DefaultValue.topMargin),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){

              },
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/home04_8jingdiansucai_zan.png",width: 20.0,height: 20.0,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: DefaultValue.topMargin),
                      child: Text("点赞",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){

              },
              child:Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/home04_8jingdiansucai_xiazai.png",width: 20.0,height: 20.0,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: DefaultValue.topMargin),
                      child: Text("下载",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){

              },
              child:Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/home04_8jingdiansucai_fuzhi.png",width: 20.0,height: 20.0,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: DefaultValue.topMargin),
                      child: Text("复制",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){

               },
              child:Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/home04_8jingdiansucai_zhuanfa.png",width: 20.0,height: 20.0,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: DefaultValue.topMargin),
                      child: Text("转发",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.textSize
                        ),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget getWords(var text){
    return Container(
      padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
      child: Text(text,
        style: TextStyle(
            color: Colors.grey,
            fontSize: DefaultValue.textSize
        ),),
    );
  }
  Widget getTime(var time){
    return Container(
      padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(time,
            style: TextStyle(
                color: Colors.grey,
                fontSize: DefaultValue.textSize
            ),),
          Text("查看详情",
            style: TextStyle(
                color: Colors.red,
                fontSize: DefaultValue.textSize
            ),)
        ],
      ),
    );
  }

  Widget getPersonal(MaterialInfo materialInfo){
    return Container(
      child: Row(
        children: <Widget>[
          getHeadImg(materialInfo.photo),
          Container(
            margin: EdgeInsets.only(left: DefaultValue.leftMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(materialInfo.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: DefaultValue.titleTextSize
                ),),
                Text(materialInfo.zed,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: DefaultValue.textSize
                  ),),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget getHeadImg(String url){
    return new ClipOval(
      child: SizedBox(
          width: 38.0,
          height: 38.0,
          child: url == null ?  Image.asset("images/home04_2xiugaiziliao_touxiang.png", fit: BoxFit.cover) :Image.network(url, fit: BoxFit.cover)
      ),
    );
  }
  Widget getHead(){
    return Container(
      color: Colors.white,
      height: 40.0,
      padding: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin,left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
      child: Row(
        children: <Widget>[

          Expanded(
            flex: 1,
            child: Container(
              height: 28.0,
              margin: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,),
              decoration: new BoxDecoration(
                  border: new Border.all(width: 1.0,color:ColorsUtil.GreyDialogBg ),
                  color: ColorsUtil.GreyDialogBg,
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
                          getSeachData(text);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void getSeachData(String text){

  }

}

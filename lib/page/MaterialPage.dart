import 'dart:io';

import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/dialog/LoadingDialog.dart';
import 'package:confuciusschool/model/MaterialInfo.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' show get;

class MaterialPage extends StatefulWidget {
  @override
  _MaterialPageState createState() => _MaterialPageState();
}

class _MaterialPageState extends BaseState{

  List<MaterialInfo> data;
  var controllerScroll = new ScrollController();
  final controller = TextEditingController();
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    getData("");
  }
  void getData(name){
    api.getMaterialInfo(name,(data){
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
      height: MediaQuery.of(context).size.height - 140.0,

      color: Colors.white,
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: getRow,
          itemCount: data.length,),
    );
  }
  Widget getRow(BuildContext context,int index){
    MaterialInfo materialInfo = data[index];
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                getPersonal(materialInfo),
                getWords(materialInfo.mname),
                getSubscribe(materialInfo.video),
                getTime(materialInfo.time),
                getBtn(materialInfo),
              ],
            ),
          ),
          LinsUtils.getWidthLins(context,height: 10.0)
        ],
      ),
    );
  }
  Widget getBtn(MaterialInfo materialInfo){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: DefaultValue.topMargin),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                var state = "1";
                if(materialInfo.status == 1){
                  state = "2";
                }else{
                  state = "1";
                }
                api.putGovernGood(materialInfo.id.toString(), materialInfo.type.toString(), state, (msg){
                  if(materialInfo.status == 1){
                    setState(() {
                      materialInfo.status = 2;
                      materialInfo.fnum -- ;
                    });
                  }else{
                    setState(() {
                      materialInfo.status = 1;
                      materialInfo.fnum ++ ;
                    });
                  }
                  ToastUtil.makeToast(msg);
                }, (msg){
                  ToastUtil.makeToast(msg);
                });
              },
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: materialInfo.status == 1 ? Image.asset("images/home04_8jingdiansucai_zan.png",width: 20.0,height: 20.0,color: Colors.red,) : Image.asset("images/home04_8jingdiansucai_zan.png",width: 20.0,height: 20.0,color: Colors.black,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: DefaultValue.topMargin),
                      child: Text("点赞（${materialInfo.fnum}）",
                        maxLines: 1,
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
                for(int i = 0;i< materialInfo.video.length;i++){
                  saveImg(materialInfo.video[i],i,materialInfo.video.length);
                }
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
                copy(materialInfo.mname);
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
                for(int i = 0;i< materialInfo.video.length;i++){
                  saveImg(materialInfo.video[i],i,materialInfo.video.length);
                }
                copy(materialInfo.mname);
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
            height: 40.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(materialInfo.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0
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
      padding: EdgeInsets.only(top: 4.0,bottom: 4.0,left: 4.0,right: 4.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: 50.0,
//              padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
              margin: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,),
              padding: EdgeInsets.all(2.0),
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
//                      margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                      height: 40.0,
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(2.0),
                          border: InputBorder.none,
                          hintText: '请输入关键字',
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
  void copy(var text){
    Clipboard.setData(new ClipboardData(text: text));
    ToastUtil.makeToast("已复制到剪切板");
  }
  void saveImg(var imgUrl,var i,var length) async{
    LoadingDialog.showLoadingDialog(context);
    print(imgUrl);
    print("开始下载...");
    var response = await get(imgUrl);
    print("下载完成...");
    print("开始保存...");
    var documentDirectory = await getApplicationDocumentsDirectory();

    print("正在保存...");

    var filePath = await ImagePickerSaver.saveFile(
        fileData: response.bodyBytes);
    var savedFile= File.fromUri(Uri.file(filePath));
    print("保存成功...");
    LoadingDialog.dismissLoadingDialog(context);
    if(i == length - 1){
      ToastUtil.makeToast("保存成功");
    }
  }

  void getSeachData(String text){
    getData(text);
  }
  Widget getSubscribe(List<String> data){
    var height = ((data.length / 3).toInt() + 1) * 120.0;
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: DefaultValue.topMargin),
      child: Column(
        children: <Widget>[
          Container(
            height: height,
            child: GridView.builder(
                itemCount: data.length,
                controller: controllerScroll,
                //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                    crossAxisCount: 3,
                    //纵轴间距
                    mainAxisSpacing: 9.0,
                    //横轴间距
                    crossAxisSpacing: 11.0,
//            //子组件宽高长度比例
                    childAspectRatio: 1.0
                ),
                itemBuilder: (BuildContext context, int index) {
                  //Widget Function(BuildContext context, int index)
                  return getSubscribeItem(data[index]);
                }),
          )
        ],
      ),
    );
  }
  Widget getSubscribeItem(String url){
    return GestureDetector(
      onTap: (){
//        NavigatorUtils.push(context, new VideoPlayPage(data.currid.toString(),data.id.toString()));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(url,width: 164.0,height: 100.0,fit: BoxFit.fill,),
          ],
        ),
      ),
    );
  }

}

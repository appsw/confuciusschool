import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:confuciusschool/utils/NavigatorUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AuthenticationPage extends BasefulWidget{

  List names = ["手机号","身份证号","银行卡号","所属银行","所属支行","银行预留手机号"];
  List imgsNames = ["身份证正面","身份证背面","手持身份证","银行卡"];
  List imgs = ["images/shenfenzhengfan.png","images/shenfenzhengzheng.png","images/shouchishenfenzheng.png","images/yinhangka.png"];
  var phoneController = TextEditingController();
  var accountController = TextEditingController();
  var cardIdController = TextEditingController();
  var banknameController = TextEditingController();
  var branchnameController = TextEditingController();
  var bankphoneController = TextEditingController();
  var purposeController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  List<TextEditingController> controllers = [];
  List<File> imageFiles = [null,null,null,null];
  @override
  void onCreate(BuildContext context) {
    // TODO: implement onCreate
    super.onCreate(context);
    controllers.add(phoneController);
    controllers.add(accountController);
    controllers.add(cardIdController);
    controllers.add(banknameController);
    controllers.add(branchnameController);
    controllers.add(bankphoneController);
  }
  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "实名认证");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return SingleChildScrollView(
      controller:  _scrollController,
      child: Column(
        children: <Widget>[
          getTop(),
          getBottom(),
          getBtn()
        ],
      ),
    );
  }
  Widget getBottom(){
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 13.0,right: 13.0,top: 15.0),
      padding: EdgeInsets.only(left: 11.0,right: 13.0,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
      decoration: new BoxDecoration(
          color:Colors.white,
          borderRadius:  new BorderRadius.all(Radius.circular(4.0)),
          boxShadow:  <BoxShadow>[//设置阴影
            new BoxShadow(
              color: Colors.grey,//阴影颜色
              blurRadius: 6.0,//阴影大小
            ),
          ]
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text("上传身份证及银行卡",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0
                ),),
              ),
            ),
            Expanded(
              flex: 0,
              child: GridView.count(
                crossAxisCount: 2,
                controller:  _scrollController,
                  shrinkWrap: true,
                children: List.generate(imgs.length, (index){
                  return getImageItem(index);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget getTop(){
    return Container(
      margin: EdgeInsets.only(left: 13.0,right: 13.0,top: 15.0),
      padding: EdgeInsets.only(left: 11.0,right: 13.0),
      decoration: new BoxDecoration(
          color:Colors.white,
          borderRadius:  new BorderRadius.all(Radius.circular(4.0)),
          boxShadow:  <BoxShadow>[//设置阴影
            new BoxShadow(
              color: Colors.grey,//阴影颜色
              blurRadius: 6.0,//阴影大小
            ),
          ]
      ),
      child: Column(
        children: <Widget>[
          getTitle(0),
          LinsUtils.getWidthLins(context),
          getTitle(1),
          LinsUtils.getWidthLins(context),
          getTitle(2),
          LinsUtils.getWidthLins(context),
          getTitle(3),
          LinsUtils.getWidthLins(context),
          getTitle(4),
          LinsUtils.getWidthLins(context),
          getTitle(5),
        ],
      ),
    );
  }
  Widget getTitle(int index){
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Text(names[index],
              style: TextStyle(
                  color: Colors.black,
                  fontSize: DefaultValue.textSize
              ),),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              child: TextField(
                textAlign: TextAlign.right,
                controller: controllers[index],
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(2.0),
                  border: InputBorder.none,
                  hintText: '请填写',
                  hintStyle: new TextStyle(color: Colors.grey,fontSize: DefaultValue.textSize),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget getImageItem(int index){
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        height: 120.0,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              child: imageFiles[index] == null ? Image.asset(imgs[index],width: 100.0,height: 70.0,) : Image.file(imageFiles[index],width: 100.0,height: 70.0,fit: BoxFit.fill,),
              margin: EdgeInsets.only(top: 26.0),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: Text(imgsNames[index],
                style: TextStyle(
                    color: Colors.black,
                    fontSize: DefaultValue.textSize
                ),),
            )
          ],
        ),
      ),
      onTap: (){
        _selectedImage(index);
      },
    );
  }
  Widget getBtn(){
    return Container(
      margin: EdgeInsets.only(top: 20.0,bottom: 18.0),
      child: FlatButton(
        onPressed: (){
//          NavigatorUtils.push(context, LoanPage());
        },
        color: ColorsUtil.SeekBarColor,//按钮的背景颜色
        padding: EdgeInsets.only(top:12.0,bottom: 13.0,left: 145.0,right: 145.0),//按钮距离里面内容的内边距
        child: new Text('确认提交'),
        textColor: Colors.white,//文字的颜色
        textTheme:ButtonTextTheme.normal ,//按钮的主题
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );
  }
  void _selectedImage(int index) async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if(image != null){
        imageFiles[index] = image;
      }
    });
  }

}
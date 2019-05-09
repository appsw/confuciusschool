import 'dart:io';

import 'package:confuciusschool/base/BasefulWidget.dart';
import 'package:confuciusschool/model/PersonalInfo.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:confuciusschool/dialog/LoadingDialog.dart';
import 'package:confuciusschool/httputils/Api.dart';
//import 'package:confuciusschool/model/PersonalData.dart';
import 'package:confuciusschool/utils/CityPicker.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LinsUtils.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
class PersonalDataPage extends BasefulWidget{

  File headImg;
  var nameController = TextEditingController();
  var sexController = TextEditingController();
  var address = "请选择";
  var statusString = "";
  var imgUrl = "";
  PersonalInfo data;
  Api api = new Api();
  var sex = 1;
  var birth = "";
  var bname;
  var dname;
  var ename;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    api.getPersonal((PersonalInfo data){
      setState(() {
        this.data = data;
        nameController.text = data.nickName == null ? "" : data.nickName;
        sex = data.sex;
        birth = data.birth;
        address = data.bname  == null ? "请选择" :  data.bname.toString() + data.dname.toString() + data.ename.toString() ;
        bname =  data.bname.toString();
        dname = data.dname.toString();
        ename = data.ename.toString();
      });

    }, (msg){ToastUtil.makeToast(msg);});
  }
  Widget getBody(BuildContext context){
    return data == null ? LoadingUtils.getRingLoading() : Container(
      child: Column(children: <Widget>[
        Expanded(flex: 1,child: Container(child: Column(children: <Widget>[
          getHead(),
          LinsUtils.getWidthLins(context),
          getName(),
          LinsUtils.getWidthLins(context),
          getCode(),
          LinsUtils.getWidthLins(context),
          getPhone(),
          LinsUtils.getWidthLins(context),
          getSex(),
          LinsUtils.getWidthLins(context),
          getBirth(),
          LinsUtils.getWidthLins(context),
          getAddress(),
          LinsUtils.getWidthLins(context),
//          getStatus()
        ],),),),
        Expanded(flex: 0,child: getSubmitBtn(),),

      ],),
    );
  }
  Widget getHead(){
    return Container(
      height: 90.0,
      color: Colors.white,
      margin: EdgeInsets.only(top: DefaultValue.topMargin),
      padding: EdgeInsets.all(DefaultValue.leftMargin),
      child: Row(children: <Widget>[
        Expanded(flex: 0,child: Text("头像",style: TextStyle(color: Colors.grey),),),
        Expanded(flex: 1,child: GestureDetector(child:
        Container(alignment:Alignment.centerRight,child: getHeadImg(),),
          onTap: (){
            _selectedImage();
          },),),
        Expanded(
          flex: 0,
          child: Container(
            child: Image.asset("images/home04_5_1tixinadaoyinhangka_gengduo.png",width: 7.0,height: 12.0,),
            margin: EdgeInsets.only(left: DefaultValue.rightMargin),
          ),
        )
      ],),
    );
  }
  Widget getHeadImg(){
    return new ClipOval(
      child: SizedBox(
          width: 70.0,
          height: 70.0,
          child: headImg == null ? data.profilePhoto == null  ? Image.asset("images/home04_2xiugaiziliao_touxiang.png", fit: BoxFit.cover) :Image.network(data.profilePhoto, fit: BoxFit.cover) : Image.file(headImg, fit: BoxFit.cover)
      ),
    );
  }
  void _selectedImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if(image != null){
        headImg = image;
      }
    });
  }
  Widget getName(){
    return Container(
      height: 50.0,
      color: Colors.white,
      padding: EdgeInsets.all(DefaultValue.leftMargin),
      child: Row(children: <Widget>[
        Expanded(flex: 0,child: Text("昵称",style: TextStyle(color: Colors.grey),),),
        Expanded(flex: 1,child: Container(alignment:Alignment.centerRight,child: TextField(
          controller: nameController,
          textAlign: TextAlign.end,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(2.0),
            border: InputBorder.none,
            //                        prefixIcon: new Image.asset("images/ic_username.png",width: 2.0,height: 2.0,),
            hintText: '请输入您的昵称',
            prefixStyle: new TextStyle(height: 20.0),
            hintStyle: new TextStyle(color: Colors.grey),
          ),
        ),),),
        Expanded(
          flex: 0,
          child: Container(
            child: Image.asset("images/home04_5_1tixinadaoyinhangka_gengduo.png",width: 7.0,height: 12.0,),
            margin: EdgeInsets.only(left: DefaultValue.rightMargin),
          ),
        )
      ],),
    );
  }
  Widget getCode(){
    return Container(
      height: 50.0,
      color: Colors.white,
      padding: EdgeInsets.all(DefaultValue.leftMargin),
      child: Row(children: <Widget>[
        Expanded(flex: 0,child: Text("推荐码",style: TextStyle(color: Colors.grey),),),
        Expanded(flex: 1,child: GestureDetector(
          child: Container(alignment:Alignment.centerRight,color:Colors.white,child: Text(
            data.invitecode == null ? "" : data.invitecode,style: TextStyle(color: Colors.black),
          ),),
          onTap: (){
            showModalBottomSheet(context: context, builder: (context){
              return getBottomDialog();
            });
          },
        ),),
        Expanded(
          flex: 0,
          child: Container(
//            child: Image.asset("images/home04_5_1tixinadaoyinhangka_gengduo.png",width: 7.0,height: 12.0,),
            margin: EdgeInsets.only(left: DefaultValue.rightMargin),
          ),
        )
      ],),
    );
  }
  Widget getPhone(){
    return Container(
      height: 50.0,
      color: Colors.white,
      padding: EdgeInsets.all(DefaultValue.leftMargin),
      child: Row(children: <Widget>[
        Expanded(flex: 0,child: Text("手机",style: TextStyle(color: Colors.grey),),),
        Expanded(flex: 1,child: GestureDetector(
          child: Container(alignment:Alignment.centerRight,color:Colors.white,child: Text(
            data.account == null ? "" : data.account,style: TextStyle(color: Colors.black),
          ),),
          onTap: (){
            showModalBottomSheet(context: context, builder: (context){
              return getBottomDialog();
            });
          },
        ),),
        Expanded(
          flex: 0,
          child: Container(
//            child: Image.asset("images/home04_5_1tixinadaoyinhangka_gengduo.png",width: 7.0,height: 12.0,),
            margin: EdgeInsets.only(left: DefaultValue.rightMargin),
          ),
        )
      ],),
    );
  }
  Widget getSex(){
    var sexString;
    switch(sex){
      case 1:
        sexString = "男";
        break;
      case 2:
        sexString = "女";
        break;
      default:
        sexString = "保密";
        break;

    }
    return Container(
      height: 50.0,
      color: Colors.white,
      padding: EdgeInsets.all(DefaultValue.leftMargin),
      child: Row(children: <Widget>[
        Expanded(flex: 0,child: Text("性别",style: TextStyle(color: Colors.grey),),),
        Expanded(flex: 1,child: GestureDetector(
          child: Container(alignment:Alignment.centerRight,color:Colors.white,child: Text(
            sexString,style: TextStyle(color: Colors.black),
          ),),
          onTap: (){
            showModalBottomSheet(context: context, builder: (context){
              return getBottomDialog();
            });
          },
        ),),
        Expanded(
          flex: 0,
          child: Container(
            child: Image.asset("images/home04_5_1tixinadaoyinhangka_gengduo.png",width: 7.0,height: 12.0,),
            margin: EdgeInsets.only(left: DefaultValue.rightMargin),
          ),
        )
      ],),
    );
  }

  Widget getBirth(){
    return Container(
      height: 50.0,
      color: Colors.white,
      padding: EdgeInsets.all(DefaultValue.leftMargin),
      child: Row(children: <Widget>[
        Expanded(flex: 0,child: Text("出生年月日",style: TextStyle(color: Colors.grey),),),
        Expanded(flex: 1,child: GestureDetector(
          child: Container(alignment:Alignment.centerRight,color:Colors.white,child: Text(
            birth == null ? "" : birth,style: TextStyle(color: Colors.black),
          ),),
          onTap: (){
            DatePicker.showDatePicker(
                context,
                showTitleActions: true,
                locale: 'zh',
                minYear: 1970,
                maxYear: 2020,
                initialYear: 2018,
                initialMonth: 6,
                initialDate: 21,
                cancel: Text('取消'),
                confirm: Text('确定'),
                dateFormat: 'yyyy-mm-dd',
                onChanged:(year, month, date) {
                  setState((){
                    birth = year.toString() + "-" + month.toString() + "-" + date.toString();
                  });
                },
            onConfirm: (year, month, date) {
              setState((){
                birth = year.toString() + "-" + month.toString() + "-" + date.toString();
              });
            },
            onCancel: () { },
            );
          },
        ),),
        Expanded(
          flex: 0,
          child: Container(
            child: Image.asset("images/home04_5_1tixinadaoyinhangka_gengduo.png",width: 7.0,height: 12.0,),
            margin: EdgeInsets.only(left: DefaultValue.rightMargin),
          ),
        )
      ],),
    );
  }
  Widget getBottomDialog(){
    return Container(
      height: 80.0,
//      padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,),
      child: Column(
        children: <Widget>[
          Expanded(flex: 1,child: GestureDetector(child: getDialogItem(0),onTap: (){
            setState(() {
              sex = 1;
            });
            Navigator.of(context).pop();
          },)),
          Expanded(flex: 1,child: GestureDetector(child: getDialogItem(1),onTap: (){
            setState(() {
              sex = 2;
            });
            Navigator.of(context).pop();
          },)),


        ],
      ),
    );
  }
  var dialogItemTitle = ["男","女","保密"];
  Widget getDialogItem(int index){
    return Container(
      alignment: Alignment.center,
      height: 40.0,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 39.0,
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Text(dialogItemTitle[index]),
          ),
          LinsUtils.getWidthLins(context)
        ],
      ),
    );
  }
  Widget getAddress(){
    return GestureDetector(child:
    Container(
      height: 50.0,
      color: Colors.white,
      padding: EdgeInsets.all(DefaultValue.leftMargin),
      child: Row(children: <Widget>[
        Expanded(flex: 0,child: Text("地区",style: TextStyle(color: Colors.grey),),),
        Expanded(flex: 1,child: Container(alignment:Alignment.centerRight,child: Text(address,style: TextStyle(color: Colors.grey),)),),
        Expanded(
          flex: 0,
          child: Container(
            child: Image.asset("images/home04_5_1tixinadaoyinhangka_gengduo.png",width: 7.0,height: 12.0,),
            margin: EdgeInsets.only(left: DefaultValue.rightMargin),
          ),
        )
      ],),
    ),onTap: (){
      packAddress();
    },);
  }
  Widget getStatus(){
    return GestureDetector(child:
    Container(
      height: 50.0,
      color: Colors.white,
      padding: EdgeInsets.all(DefaultValue.leftMargin),
      child: Row(children: <Widget>[
        Expanded(flex: 0,child: Text("认证状态",style: TextStyle(color: Colors.grey),),),
        Expanded(flex: 1,child: Container(alignment:Alignment.centerRight,child: Text("2" == "2" ? "审核通过" : "待提交审核",style: TextStyle(color: "2" == "2" ? Colors.grey : Colors.redAccent),)),),
      ],),
    ),onTap: (){
      packAddress();
    },);
  }
  Widget getSubmitBtn(){
    return Container(
      margin: EdgeInsets.only(bottom: 32.0),
      child: FlatButton(
        onPressed: (){
          print('点击3333333333333333333333333333333333333333333333333333333333333333333333333333333');
          upDataImg();
        },
        color: ColorsUtil.LogoutBtnBg,//按钮的背景颜色
        padding: EdgeInsets.only(top:13.0,bottom: 14.0,left: 146.0,right: 146.0),//按钮距离里面内容的内边距
        child: new Text('保存',style: TextStyle(fontSize: DefaultValue.loginBtnSize),),
        textColor: Colors.white,//文字的颜色
        textTheme:ButtonTextTheme.normal ,//按钮的主题
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
  void upDataImg(){

    var nichname = nameController.text;

    if(nichname.isEmpty  && address .isEmpty){
      ToastUtil.makeToast("请完善信息");
      return;
    }
    LoadingDialog.showLoadingDialog(context);
    data.nickName = nichname;
    data.sex = sex;

    if(headImg != null){
      api.upLoadImg(headImg, (url){
        imgUrl = url;
        submitData();
      }, (msg){
        Navigator.of(context).pop();
        ToastUtil.makeToast(msg);
      });
    }else{
      submitData();
    }

  }
  void submitData(){
    api.submitPersonal( data.nickName,imgUrl, data.sex.toString(),birth, bname,dname,ename, (msg){
      Navigator.of(context).pop();
      ToastUtil.makeToast(msg);
    }, (msg){
      Navigator.of(context).pop();
      ToastUtil.makeToast(msg);
    });
  }
  void packAddress(){
    CityPicker.showCityPicker(
      context,
      selectProvince: (province) {
        print(province);
        setState(() {
          address = province["name"];
          bname = province["name"];
        });
      },
      selectCity: (city) {
        print(city);
        setState(() {
          address += city["name"];
          dname = city["name"];
        });
      },
      selectArea: (area) {
        print(area);
        setState(() {
          address += area["name"];
          ename = area["name"];
//          data.namePath = area["code"];
        });
      },
    );
  }

  @override
  Widget getAppBar(BuildContext context) {
    // TODO: implement getAppBar
    return PageUtils.getAppBar(context, "修改资料");
  }
}
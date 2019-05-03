import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/model/MyTeamMemberInfo.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class MyTeamMemberPage extends StatefulWidget {
  @override
  _MyTeamMemberPageState createState() => _MyTeamMemberPageState();
}

class _MyTeamMemberPageState extends BaseState {

  MyTeamMemberInfo data;

  @override
  void initData() {
    // TODO: implement initState
    super.initData();
    api.getMyTeamMember((data){
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
    return PageUtils.getAppBar(context, "我的会员");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return data == null ? LoadingUtils.getRingLoading() : Container(
      child: getList(),
    );
  }
  Widget getList(){
    return Container(
      height: MediaQuery.of(context).size.height - 120.0,
      color: Colors.white,
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: getRow,
          itemCount: data.res.length,
          scrollDirection: Axis.vertical),
    );
  }
  Widget getRow(BuildContext context,int index){
    Res res = data.res[index];
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getHeadImg(res.profilePhoto),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Text("${res.nickName}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: DefaultValue.titleTextSize
                              ),),
                          ),
                          Text("${res.account}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: DefaultValue.titleTextSize
                            ),),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
                        child: Text("${res.createTime}",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: DefaultValue.textSize
                          ),),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget getHeadImg(String url){
    return new ClipOval(
      child: SizedBox(
          width: 45.0,
          height: 45.0,
          child: url == null ?  Image.asset("images/home04_2xiugaiziliao_touxiang.png", fit: BoxFit.cover) :Image.network(url, fit: BoxFit.cover)
      ),
    );
  }
}

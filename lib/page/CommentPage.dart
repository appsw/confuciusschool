import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/dialog/LoadingDialog.dart';
import 'package:confuciusschool/model/CommentInfo.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommentPage extends StatefulWidget {
  var id;
  CommentPage(this.id);
  @override
  _CommentPageState createState() => _CommentPageState(id);
}

class _CommentPageState extends BaseState {

  List<CommentInfo> data;
  var id;
  _CommentPageState(this.id);
  var isEdit = true;
  final controller = TextEditingController();
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    api.getComment(id, (data){
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
    return PageUtils.getAppBar(context, "全部评论");
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      child: data == null ? LoadingUtils.getRingLoading() : getList(),
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
    CommentInfo commentInfo = data[index];
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
              getHeadImg(commentInfo.profilePhoto),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("${commentInfo.nickName}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.titleTextSize
                        ),),
                      Container(
                        margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
                        child: Text("${commentInfo.content}",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: DefaultValue.textSize
                          ),),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Text("${commentInfo.createTime}",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: DefaultValue.textSize
                              ),),
                          ),
                          Image.asset("images/home01_7quanbupinglun_pinglun.png",width: 12.0,height: 12.0,),
                          commentInfo.replay.length == 0 ? Container() : Container(
                            child: Text("(${commentInfo.replay.length})",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: DefaultValue.textSize
                              ),),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                            child: Image.asset("images/home01_7quanbupinglun_shoucang.png",width: 12.0,height: 12.0,),
                          ),
                          commentInfo.zanCount == 0 ? Container() : Container(
                            child: Text("(${commentInfo.zanCount})",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: DefaultValue.textSize
                              ),),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        commentInfo.replay == 0 ? Container() : Container(
          child: getReplayList(commentInfo),
        )
      ],
    );
  }
  Widget getReplayList(CommentInfo commentInfo){

    return Container(
      height: 70.0 * commentInfo.replay.length,
      color: Colors.white,
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context,int index){
            getReplayRow(context, index,commentInfo);
          },
          itemCount: commentInfo.replay.length,
          scrollDirection: Axis.vertical),
    );
  }
  Widget getReplayRow(BuildContext context,int index,CommentInfo commentInfo){
    Replay replay = commentInfo.replay[index];
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
              getHeadImg(commentInfo.profilePhoto),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("${commentInfo.nickName}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: DefaultValue.titleTextSize
                        ),),
                      Container(
                        margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
                        child: Text("${commentInfo.content}",
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
          width: 35.0,
          height: 35.0,
          child: url == null ?  Image.asset("images/home04_2xiugaiziliao_touxiang.png", fit: BoxFit.cover) :Image.network(url, fit: BoxFit.cover)
      ),
    );
  }
  @override
  Widget getBottomNavigationBar(BuildContext context) {
    // TODO: implement getBottomNavigationBar
    return !isEdit ? Container(height: 0.0,) : Container(
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
      color:ColorsUtil.GreyDialogBg,
      child: Container(
        height: 30.0,
        alignment: Alignment.centerLeft,
        decoration: new BoxDecoration(
            border: new Border.all(width: 1.0,color:ColorsUtil.GreyDialogBg ),
            color: Colors.white,
            borderRadius:  new BorderRadius.all(Radius.circular(4.0))
        ),
        child: TextField(
          controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(2.0),
              border: InputBorder.none,
              hintText: '写点感想....',
              prefixStyle: new TextStyle(height: 20.0),
              hintStyle: new TextStyle(color: ColorsUtil.LogEditBg,fontSize: DefaultValue.messageTextSize),
            ),
          onSubmitted: (text){
            LoadingDialog.showLoadingDialog(context);
            putComment(text);
          },
        ),
      ),
    );
  }
  void putComment(var text){
    api.putComment(id, text, (msg){
      LoadingDialog.dismissLoadingDialog(context);
      ToastUtil.makeToast(msg);
      Navigator.pop(context);
    }, (msg){
      LoadingDialog.dismissLoadingDialog(context);
      ToastUtil.makeToast(msg);
    });
  }

}

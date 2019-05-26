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

class EntrepreneurCommentPage extends StatefulWidget {
  var id;
  EntrepreneurCommentPage(this.id);
  @override
  _EntrepreneurCommentPageState createState() => _EntrepreneurCommentPageState(id);
}

class _EntrepreneurCommentPageState extends BaseState {

  List<CommentInfo> data;
  var id;
  _EntrepreneurCommentPageState(this.id);
  var isEdit = true;
  final controller = TextEditingController();
  bool isShowRelePlay = false;
  String commentId;
  var hintText = "写点感想....";
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    api.getEntrepreneurComment(id, (data){
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
    return GestureDetector(
      onTap: (){
        setState(() {
          isShowRelePlay = !isShowRelePlay;
          commentId = commentInfo.id.toString();
          if(isShowRelePlay){
            hintText = "对${commentInfo.nickName}进行评论";
          }else{
            hintText = "写点感想....";
          }
        });
      },
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                              fontSize: 15.0
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
                            GestureDetector(
                              child: Container(
                                margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                                width: 40.0,
                                height: 40.0,
                                color: Colors.white,
                                padding: EdgeInsets.only(top: 14.0,bottom: 14.0,left: 14.0,right: 14.0),
                                child: commentInfo.status == "1" ? Image.asset("images/home01_7quanbupinglun_shoucang.png",width: 12.0,height: 12.0,color: Colors.red,) : Image.asset("images/home01_7quanbupinglun_shoucang.png",width: 12.0,height: 12.0,),
                              ),
                              onTap: (){
                                var status = "1";
                                if(commentInfo.status == "1"){
                                  status = "2";
                                  setState(() {
                                    commentInfo.status = "2";
                                  });
                                }else{
                                  setState(() {
                                    commentInfo.status = "1";
                                  });
                                }
                                api.getEntrepreneurCommentZan(commentInfo.id.toString(), status, (msg){
                                  ToastUtil.makeToast(msg);
                                }, (msg){
                                  ToastUtil.makeToast(msg);
                                });
                              },
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
          commentInfo.replay.length == 0 ? Container() : Container(
            child: getReplayList(commentInfo),
          )
        ],
      ),
    );
  }
  Widget getReplayList(CommentInfo commentInfo){

    return Container(
      height: 70.0 * commentInfo.replay.length,
      color: Colors.white,
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context,int index){
            return getReplayRow(context, index,commentInfo);
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
          margin: EdgeInsets.only(left: 45.0),
          color: Colors.white,
          padding: EdgeInsets.only(left: DefaultValue.leftMargin,right: DefaultValue.rightMargin,top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getHeadImg(replay.profilePhoto),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: DefaultValue.leftMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("${replay.nickName}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0
                        ),),
                      Container(
                        margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
                        child: Text("${replay.content}",
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
            hintText: '$hintText',
            prefixStyle: new TextStyle(height: 20.0),
            hintStyle: new TextStyle(color: ColorsUtil.LogEditBg,fontSize: DefaultValue.messageTextSize),
          ),
          onSubmitted: (text){
            LoadingDialog.showLoadingDialog(context);
            if(isShowRelePlay){
              getCommentReplay(text);
            }else{
              putComment(text);
            }
          },
        ),
      ),
    );
  }
  void putComment(var text){
    api.putEntrepreneurComment(id, text, (msg){
      LoadingDialog.dismissLoadingDialog(context);
      ToastUtil.makeToast(msg);
      Navigator.pop(context);
    }, (msg){
      LoadingDialog.dismissLoadingDialog(context);
      ToastUtil.makeToast(msg);
    });
  }
  void getCommentReplay(var text){
    api.getEntrepreneurCommentReplay(id,commentId,commentId, text, (msg){
      LoadingDialog.dismissLoadingDialog(context);
      ToastUtil.makeToast(msg);
      Navigator.pop(context);
    }, (msg){
      LoadingDialog.dismissLoadingDialog(context);
      ToastUtil.makeToast(msg);
    });
  }

}

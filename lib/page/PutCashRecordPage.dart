import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/model/IncomeInfo.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class PutCashRecordPage extends StatefulWidget {
  @override
  _PutCashRecordPageState createState() => _PutCashRecordPageState();
}

class _PutCashRecordPageState extends BaseState {
  List<IncomeInfo> data;
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    api.getPutCashList((data){
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
    return PageUtils.getAppBar(context, "提现记录");
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
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: getRow,
          itemCount: data.length,
          scrollDirection: Axis.vertical),
    );
  }
  Widget getRow(BuildContext context,int index){
    IncomeInfo incomeInfo = data[index];
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
                            child: Text("转入银行卡",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: DefaultValue.titleTextSize
                              ),),
                          ),
                          Text("-${incomeInfo.total}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: DefaultValue.titleTextSize
                            ),),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: DefaultValue.topMargin,bottom: DefaultValue.bottomMargin),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text("${incomeInfo.createTime}",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: DefaultValue.textSize
                                ),),
                            ),
                            Text("${incomeInfo.after}",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: DefaultValue.textSize
                              ),),
                          ],
                        ),
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
}

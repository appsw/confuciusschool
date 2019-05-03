import 'package:confuciusschool/base/BaseState.dart';
import 'package:confuciusschool/model/IncomeInfo.dart';
import 'package:confuciusschool/utils/DefaultValue.dart';
import 'package:confuciusschool/utils/LoadingUtils.dart';
import 'package:confuciusschool/utils/PageUtils.dart';
import 'package:confuciusschool/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class IncomePage extends StatefulWidget {
  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends BaseState {

  List<IncomeInfo> data;
  @override
  void initData() {
    // TODO: implement initData
    super.initData();
    api.getIncomeList((data){
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
    return PageUtils.getAppBar(context, "收入明细");
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
                            child: Text("从银行卡转入",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: DefaultValue.titleTextSize
                              ),),
                          ),
                          Text("+${incomeInfo.total}",
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

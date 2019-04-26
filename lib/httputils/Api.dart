import 'dart:io';

import 'package:confuciusschool/httputils/ApiUrl.dart';
import 'package:confuciusschool/httputils/CommonService.dart';
import 'package:confuciusschool/model/BaseResponse.dart';
import 'package:confuciusschool/model/Classification.dart';
import 'package:confuciusschool/model/HomeInfo.dart';
import 'package:confuciusschool/utils/Constant.dart';
import 'package:confuciusschool/utils/SharedPreferencesUtil.dart';



class Api extends CommonService{
  static String token = Constant.TOKENVALUE;
  Api({String TOKEN}): super(TOKEN==null ? token : TOKEN);
  void Login(String phone,String password,Function callback,Function errorCallBack){
    params.clear();
    params["account"] = phone;
    params["password"] = password;
    request(ApiUrl.Login,(BaseResponse response){
//      User user = User.fromJson(response.data);
//      SharedPreferencesUtil.saveString(Constant.PHONE,user.phone,(bool result){
//        callback(user);
//      });
      callback("登录成功");
    },method: POST,errorCallBack: errorCallBack);
  }
  void codeLogin(String phone,String code,Function callback,Function errorCallBack){
    params.clear();
    params["account"] = phone;
    params["code"] = code;
    request(ApiUrl.codeLogin,(BaseResponse response){
//      User user = User.fromJson(response.data);
//      SharedPreferencesUtil.saveString(Constant.PHONE,user.phone,(bool result){
//        callback(user);
//      });
      callback("登录成功");
    },method: POST,errorCallBack: errorCallBack);
  }
  void SendSms(String phone,String type,Function callback,Function errorCallBack){
    params.clear();
    params["account"] = phone;
    params["type"] = type;
    request(ApiUrl.GetSMS,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void Register(String phone,String password,String code,String invitecode,Function callback,Function errorCallBack){
    params.clear();
    params["phone"] = phone;
    params["password"] = password;
    params["code"] = code;
    params["invitecode"] = invitecode;
    request(ApiUrl.Register,(BaseResponse response){
      callback(response.data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void ForgetPswd(String phone,String password,String code,Function callback,Function errorCallBack){
    params.clear();
    params["phone"] = phone;
    params["password"] = password;
    params["code"] = code;
    request(ApiUrl.ForgetPswd,(BaseResponse response){
      callback(response.data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getToken(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.GetToken,(BaseResponse response){
      String token = response.data;
      callback(token);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getHomeData(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getHomeData,(BaseResponse response){
      HomeInfo data = HomeInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getClassification(String type,Function callback,Function errorCallBack){
    params.clear();
    params["type"] = type;
    request(ApiUrl.getClassification,(BaseResponse response){
      List<Classification> data = getClassificationList(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }

}
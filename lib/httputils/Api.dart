import 'dart:io';

import 'package:confuciusschool/httputils/ApiUrl.dart';
import 'package:confuciusschool/httputils/CommonService.dart';
import 'package:confuciusschool/model/AudioInfo.dart';
import 'package:confuciusschool/model/BaseResponse.dart';
import 'package:confuciusschool/model/Classification.dart';
import 'package:confuciusschool/model/CommentInfo.dart';
import 'package:confuciusschool/model/HomeInfo.dart';
import 'package:confuciusschool/model/IntroductionInfo.dart';
import 'package:confuciusschool/model/MemberInfo.dart';
import 'package:confuciusschool/model/NewsInfo.dart';
import 'package:confuciusschool/model/PersonalInfo.dart';
import 'package:confuciusschool/model/VideoInfo.dart';
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
  void getAudioData(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getAudioData,(BaseResponse response){
      AudioInfo data = AudioInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getClassification(String type,String stype,Function callback,Function errorCallBack){
    params.clear();
    params["type"] = type;
    params["stype"] = stype;
    request(ApiUrl.getClassification,(BaseResponse response){
      List<Classification> data = getClassificationList(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getSeachByName(String type,String name,Function callback,Function errorCallBack){
    params.clear();
    params["type"] = type;
    params["name"] = name;
    request(ApiUrl.getSeachByName,(BaseResponse response){
      List<Classification> data = getClassificationList(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getAudioClassification(String type,String stype,Function callback,Function errorCallBack){
    params.clear();
    params["type"] = type;
    params["stype"] = stype;
    request(ApiUrl.getAudioClassification,(BaseResponse response){
      List<Classification> data = getClassificationList(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getVideoDetail(String currid,String id,Function callback,Function errorCallBack){
    params.clear();
    params["currid"] = currid;
    params["id"] = id;
    request(ApiUrl.getVideoDetail,(BaseResponse response){
      VideoInfo data = VideoInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getVideoIntroduction(String currid,Function callback,Function errorCallBack){
    params.clear();
    params["currid"] = currid;
    request(ApiUrl.getVideoIntroduction,(BaseResponse response){
      IntroductionInfo data = IntroductionInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getVideoText(String currid,Function callback,Function errorCallBack){
    params.clear();
    params["currid"] = currid;
    request(ApiUrl.getVideoText,(BaseResponse response){
      callback(response.data["introduce"]);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getComment(String pid,Function callback,Function errorCallBack){
    params.clear();
    params["pid"] = pid;
    request(ApiUrl.getComment,(BaseResponse response){
      List<CommentInfo> data = getCommentInfoList(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void putComment(String pid,String content,Function callback,Function errorCallBack){
    params.clear();
    params["pid"] = pid;
    params["content"] = content;
    request(ApiUrl.putComment,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getNews(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getNews,(BaseResponse response){
      List<NewsInfo> data = getNewsInfoList(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getMember(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getMember,(BaseResponse response){
      MemberInfo data = MemberInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void putPayPswd(String password,String npassword,Function callback,Function errorCallBack){
    params.clear();
    params["password"] = password;
    params["npassword"] = npassword;
    request(ApiUrl.putPayPswd,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void changePayPswdGetSMS(String phone,Function callback,Function errorCallBack){
    params.clear();
    params["account"] = phone;
    request(ApiUrl.changePayPswdGetSMS,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void changePayPswd(String code,String password,String npassword,Function callback,Function errorCallBack){
    params.clear();
    params["code"] = code;
    params["password"] = password;
    params["npassword"] = npassword;
    request(ApiUrl.changePayPswd,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void changePswdGetSMS(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.changePswdGetSMS,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void changePswd(String code,String password,String password1,Function callback,Function errorCallBack){
    params.clear();
    params["code"] = code;
    params["password"] = password;
    params["password1"] = password1;
    request(ApiUrl.changePswd,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void changePhoneGetSMS(String phone,Function callback,Function errorCallBack){
    params.clear();
    params["account"] = phone;
    request(ApiUrl.changePhoneGetSMS,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void changePhone(String code,String account,Function callback,Function errorCallBack){
    params.clear();
    params["code"] = code;
    params["account"] = account;
    request(ApiUrl.changePswd,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getPhone(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getPhone,(BaseResponse response){
      callback(response.data["account"]);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getPersonal(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getPersonal,(BaseResponse response){
      PersonalInfo data = PersonalInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void changePersonal(String nickName,String profilePhoto,String sex,String birth,String bname,String dname,String ename,Function callback,Function errorCallBack){
    params.clear();
    params["nickName"] = nickName;
    params["profilePhoto"] = profilePhoto;
    params["sex"] = sex;
    params["birth"] = birth;
    params["bname"] = bname;
    params["dname"] = dname;
    params["ename"] = ename;
    request(ApiUrl.changePersonal,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }

}
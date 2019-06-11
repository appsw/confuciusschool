import 'dart:io';

import 'package:confuciusschool/httputils/ApiUrl.dart';
import 'package:confuciusschool/httputils/CommonService.dart';
import 'package:confuciusschool/model/AboutInfo.dart';
import 'package:confuciusschool/model/AccountInfo.dart';
import 'package:confuciusschool/model/ActivityDetailsInfo.dart';
import 'package:confuciusschool/model/ActivityInfo.dart';
import 'package:confuciusschool/model/AudioInfo.dart';
import 'package:confuciusschool/model/BankInfo.dart';
import 'package:confuciusschool/model/BaseResponse.dart';
import 'package:confuciusschool/model/BecomeVipInfo.dart';
import 'package:confuciusschool/model/Classification.dart';
import 'package:confuciusschool/model/CommentInfo.dart';
import 'package:confuciusschool/model/CourseInfo.dart';
import 'package:confuciusschool/model/EntrepreneurialTitleInfo.dart';
import 'package:confuciusschool/model/EntrepreneurshipInfo.dart';
import 'package:confuciusschool/model/HomeInfo.dart';
import 'package:confuciusschool/model/IncomeInfo.dart';
import 'package:confuciusschool/model/IntroductionInfo.dart';
import 'package:confuciusschool/model/MaterialInfo.dart';
import 'package:confuciusschool/model/MemberInfo.dart';
import 'package:confuciusschool/model/MyBuyInfo.dart';
import 'package:confuciusschool/model/MyCollectionInfo.dart';
import 'package:confuciusschool/model/MyPointsInfo.dart';
import 'package:confuciusschool/model/MyTeamInfo.dart';
import 'package:confuciusschool/model/MyTeamMemberInfo.dart';
import 'package:confuciusschool/model/NewsInfo.dart';
import 'package:confuciusschool/model/PersonalInfo.dart';
import 'package:confuciusschool/model/PutCashDataInfo.dart';
import 'package:confuciusschool/model/ShareInfo.dart';
import 'package:confuciusschool/model/ShopInfo.dart';
import 'package:confuciusschool/model/SignInShowInfo.dart';
import 'package:confuciusschool/model/SigninInfo.dart';
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
    params["account"] = phone;
    params["password"] = password;
    params["code"] = code;
    params["invitecode"] = invitecode;
    request(ApiUrl.Register,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void ForgetPswd(String account,String password,String newpass,String code,Function callback,Function errorCallBack){
    params.clear();
    params["account"] = account;
    params["password"] = password;
    params["newpass"] = newpass;
    params["code"] = code;
    request(ApiUrl.forgetPasswd,(BaseResponse response){
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
  void getSeachByName(String type,String name,String stype,Function callback,Function errorCallBack){
    params.clear();
    params["type"] = type;
    params["name"] = name;
    params["stype"] = stype;
    request(ApiUrl.getSeachByName,(BaseResponse response){
      List<Classification> data = getClassificationList(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getSeachAudioByName(String type,String name,Function callback,Function errorCallBack){
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
  void getShopVideoDetail(String currid,String id,Function callback,Function errorCallBack){
    params.clear();
    params["currid"] = currid;
    params["id"] = id;
    request(ApiUrl.getShopVideoDetail,(BaseResponse response){
      VideoInfo data = VideoInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getAudioDetail(String currid,String id,Function callback,Function errorCallBack){
    params.clear();
    params["currid"] = currid;
    params["id"] = id;
    request(ApiUrl.getAudioDetail,(BaseResponse response){
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
  void putEntrepreneurshipGood(String id,String type,String status,Function callback,Function errorCallBack){
    params.clear();
    params["id"] = id;
    params["type"] = type;
    params["status"] = status;
    request(ApiUrl.putEntrepreneurshipGood,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void weixinLogin(String openid,Function callback,Function errorCallBack){
    params.clear();
    params["openid"] = openid;
    request(ApiUrl.weixinLogin,(BaseResponse response){
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
    request(ApiUrl.changePhone,(BaseResponse response){
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
  void getMyTeam(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getMyTeam,(BaseResponse response){
      MyTeamInfo data = MyTeamInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getMyTeamMember(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getMyTeamMember,(BaseResponse response){
      MyTeamMemberInfo data = MyTeamMemberInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getSignInShow(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getSignInShow,(BaseResponse response){
      SignInShowInfo data = SignInShowInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getSignInImage(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getSignInImage,(BaseResponse response){
      SignInShowInfo data = SignInShowInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void upLoadImg(File file,Function callback,Function errorCallBack){
    params.clear();
    params["img"] = file;
    request(ApiUrl.upLoadImg,(BaseResponse response){
      callback(response.data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void changeSigninImg(var file,Function callback,Function errorCallBack){
    params.clear();
    params["img"] = file;
    request(ApiUrl.changeSigninImg,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void changeSigninText(String words,Function callback,Function errorCallBack){
    params.clear();
    params["words"] = words;
    request(ApiUrl.changeSigninText,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }

  void changeBrand(var file,String brand,Function callback,Function errorCallBack){
    params.clear();
    params["rimg"] = file;
    params["brand"] = brand;
    request(ApiUrl.changeBrand,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void signIn(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.signIn,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getAccount(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getAccount,(BaseResponse response){
      AccountInfo data = AccountInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getIncomeList(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getIncomeList,(BaseResponse response){
      List<IncomeInfo> data = getIncomeInfoList(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getPutCashList(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getPutCashList,(BaseResponse response){
      List<IncomeInfo> data = getIncomeInfoList(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getBecomeVipInfo(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getBecomeVipInfo,(BaseResponse response){
      BecomeVipInfo data = BecomeVipInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getMaterialInfo(String name,Function callback,Function errorCallBack){
    params.clear();
    params["mname"] = name;
    request(ApiUrl.getMaterialInfo,(BaseResponse response){
      List<MaterialInfo> data = getMaterialInfoList(response.data["arr"]);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getCourseInfo(String name,Function callback,Function errorCallBack){
    params.clear();
    params["cname"] = name;
    request(ApiUrl.getCourseInfo,(BaseResponse response){
      List<CourseInfo> data = getCourseInfoList(response.data["arr1"]);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getShopInfo(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getShopInfo,(BaseResponse response){
      ShopInfo data = ShopInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getMyPoints(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getMyPoints,(BaseResponse response){
      MyPointsInfo data = MyPointsInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void putFeed(String details,Function callback,Function errorCallBack){
    params.clear();
    params["details"] = details;
    request(ApiUrl.putFeed,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getActivities(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getActivities,(BaseResponse response){
      ActivityInfo data = ActivityInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getActivitiesDetails(String id,Function callback,Function errorCallBack){
    params.clear();
    params["id"] = id;
    request(ApiUrl.getActivitiesDetails,(BaseResponse response){
      ActivityDetailsInfo data = ActivityDetailsInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getSettingData(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getSettingData,(BaseResponse response){
      callback(response.data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getMyCollection(String type,Function callback,Function errorCallBack){
    params.clear();
    params["type"] = type;
    request(ApiUrl.getMyCollection,(BaseResponse response){
      List<Classification> data = getClassificationList(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getAbout(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getAbout,(BaseResponse response){
      AboutInfo data = AboutInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getEntrepreneurship(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getEntrepreneurship,(BaseResponse response){
      EntrepreneurshipInfo data = EntrepreneurshipInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getAgent(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getAgent,(BaseResponse response){
      EntrepreneurshipInfo data = EntrepreneurshipInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getPutCashData(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getPutCashData,(BaseResponse response){
      PutCashDataInfo data = PutCashDataInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getBankList(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getBankInfoList,(BaseResponse response){
      List<BankInfo>  data = getBankInfoList(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void addBank(String deposit,String bankName,String name,String banknum,Function callback,Function errorCallBack){
    params.clear();
    params["deposit"] = deposit;
    params["bankName"] = bankName;
    params["name"] = name;
    params["banknum"] = banknum;
    request(ApiUrl.addBank,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void putCash(String number,String password,String bcid,Function callback,Function errorCallBack){
    params.clear();
    params["number"] = number;
    params["password"] = password;
    params["bcid"] = bcid;
    request(ApiUrl.putCash,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void submitPersonal(String nickName,String profilePhoto,String sex,String birth,String bname,String dname,String ename,Function callback,Function errorCallBack){
    params.clear();
    params["nickName"] = nickName;
    params["profilePhoto"] = profilePhoto;
    params["sex"] = sex;
    params["birth"] = birth;
    params["bid"] = bname;
    params["did"] = dname;
    params["eid"] = ename;
    request(ApiUrl.submitPersonal,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getSigninInfo(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getSigninInfo,(BaseResponse response){
      SigninInfo data = SigninInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getMyBuy(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getMyBuy,(BaseResponse response){
      List<MyBuyInfo>  data = getMyBuyInfoList(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void putGovernGood(String mid,String type,String status,Function callback,Function errorCallBack){
    params.clear();
    params["mid"] = mid;
    params["type"] = type;
    params["status"] = status;
    request(ApiUrl.putGovernGood,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void putGovernGoods(String mid,String type,String status,Function callback,Function errorCallBack){
    params.clear();
    params["cid"] = mid;
    params["type"] = type;
    params["status"] = status;
    request(ApiUrl.putGovernGoods,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getExtension(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getExtension,(BaseResponse response){
      callback(response.data["one"]);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getGuide(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getGuide,(BaseResponse response){
      callback(response.data["explain"]);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getEntrepreneurialTitle(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getEntrepreneurialTitle,(BaseResponse response){
      EntrepreneurialTitleInfo data = EntrepreneurialTitleInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getEntrepreneurInfo(String id,Function callback,Function errorCallBack){
    params.clear();
    params["id"] = id;
    request(ApiUrl.getEntrepreneurship,(BaseResponse response){
      EntrepreneurshipInfo data = EntrepreneurshipInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getCommentZan(String id,String status,Function callback,Function errorCallBack){
    params.clear();
    params["id"] = id;
    params["status"] = status;
    request(ApiUrl.getCommentZan,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getCommentReplay(String pid,String fid,String cid,String content,Function callback,Function errorCallBack){
    params.clear();
    params["pid"] = pid;
    params["fid"] = fid;
    params["cid"] = cid;
    params["content"] = content;
    request(ApiUrl.getCommentReplay,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getEntrepreneurComment(String id,Function callback,Function errorCallBack){
    params.clear();
    params["id"] = id;
    request(ApiUrl.getEntrepreneurComment,(BaseResponse response){
      List<CommentInfo> data = getCommentInfoList(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getEntrepreneurCommentZan(String id,String status,Function callback,Function errorCallBack){
    params.clear();
    params["id"] = id;
    params["status"] = status;
    request(ApiUrl.getEntrepreneurCommentZan,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getVideoZan(String id,String status,Function callback,Function errorCallBack){
    params.clear();
    params["id"] = id;
    params["status"] = status;
    request(ApiUrl.getVideoZan,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getVideoShou(String id,String type,String status,Function callback,Function errorCallBack){
    params.clear();
    params["id"] = id;
    params["type"] = type;
    params["status"] = status;
    request(ApiUrl.getVideoShou,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void putEntrepreneurComment(String pid,String content,Function callback,Function errorCallBack){
    params.clear();
    params["id"] = pid;
    params["content"] = content;
    request(ApiUrl.putEntrepreneurComment,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getEntrepreneurCommentReplay(String pid,String fid,String cid,String content,Function callback,Function errorCallBack){
    params.clear();
    params["pid"] = pid;
    params["fid"] = fid;
    params["cid"] = cid;
    params["content"] = content;
    request(ApiUrl.getEntrepreneurCommentReplay,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void weixinBind(String openid,String phone,String code,Function callback,Function errorCallBack){
    params.clear();
    params["openid"] = openid;
    params["phone"] = phone;
    params["code"] = code;
    request(ApiUrl.weixinBind,(BaseResponse response){
      callback(response.msg);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getRegistAgreement(Function callback,Function errorCallBack){
    params.clear();
    request(ApiUrl.getRegistAgreement,(BaseResponse response){
      callback(response.data["explain"]);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getShearData(String id,Function callback,Function errorCallBack){
    params.clear();
    params["id"] = id;
    request(ApiUrl.getShearData,(BaseResponse response){
      ShareInfo data = ShareInfo.fromJson(response.data);
      callback(data);
    },method: POST,errorCallBack: errorCallBack);
  }
  void getPayData(String type,String paytype,String id,String integral,String money,Function callback,Function errorCallBack){
    params.clear();
    params["type"] = type;
    params["paytype"] = paytype;
    params["id"] = id;
    params["integral"] = integral;
    params["money"] = money;
    request(ApiUrl.getPayData,(BaseResponse response){
      callback(response.data["id"]);
    },method: POST,errorCallBack: errorCallBack);
  }
}
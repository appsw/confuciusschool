


import 'package:confuciusschool/utils/SharedPreferencesUtil.dart';

class Constant{

  static const String TOKEN = "TOKEN";
  static const String MEMBER = "MEMBER";
  static const String PHONE = "PHONE";
  static const String ISAUTOPLAY = "ISAUTOPLAY";
  static const String ISLOGIN = "1";
  static const String MEMBERVALUE = "";
  static String TOKENVALUE = "";
  static void setTOKENVALUE(String token){
    TOKENVALUE = token;
  }
  static Future<String> getToken() async{
    final Token = await SharedPreferencesUtil.getString(Constant.TOKEN);
    if(Token != null){
      TOKENVALUE = Token;
    }
    return Token;
  }
}
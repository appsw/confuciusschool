import 'dart:io';

import 'package:dio/dio.dart';
import 'package:confuciusschool/httputils/ApiUrl.dart';
import 'package:confuciusschool/model/BaseResponse.dart';

class CommonService{

  String GET = "get";
  String POST = "post";
  Dio dio ;
  var Token;
  void setToken(var toktn){
    this.Token = toktn;
  }

  Map<String, dynamic> params;
  CommonService(this.Token){
    params = new Map<String, dynamic>();
  }

  void request(String url, Function callBack,
      { String method,
        Function errorCallBack}) async {
    // 配置dio实例
    dio = new Dio();
    dio.options.baseUrl=ApiUrl.BaseUrl;
    dio.options.connectTimeout = 10000; //5s
    dio.options.receiveTimeout=3000;


    print("<net> url :<" + method + ">" + url);
    params["token"] = Token;


    if (params != null && params.isNotEmpty) {
      print("<net> params :" + params.toString());
    }

    String errorMsg = "";
    int statusCode;

    try {
      Response response;
      if (method == GET) {
        //组合GET请求的参数
        if (params != null && params.isNotEmpty) {
          StringBuffer sb = new StringBuffer("?");
          params.forEach((key, value) {
            sb.write("$key" + "=" + "$value" + "&");
          });
          String paramStr = sb.toString();
          paramStr = paramStr.substring(0, paramStr.length - 1);
          url += paramStr;
        }
        response = await dio.get(url);
      } else {
        if (params != null && params.isNotEmpty) {
          FormData formData = new FormData();
          formData.addAll(params);
          params.forEach((key,value){
            if(value is File){
              String path = value.path;
              String name = path.substring(path.lastIndexOf("/"),path.length);
              print("FileName = $name");
              formData.add(key,new UploadFileInfo(value, name));
            }else{
              formData.add(key, value);
            }
          });
          response = await dio.post(url, data: formData);
        } else {
          response = await dio.post(url);
        }
      }


      statusCode = response.statusCode;
      print("<net> response statusCode:" + statusCode.toString());
      //处理错误部分
      if (statusCode != 200) {
        errorMsg = "网络请求错误,状态码:" + statusCode.toString();
        _handError(errorCallBack,statusCode, errorMsg);
        return;
      }

      if (callBack != null) {
        print("<net> response data:" + response.data.toString());
        BaseResponse baseResponse = BaseResponse.fromJson(response.data);

        if(baseResponse.code == 0){
          callBack(baseResponse);
        }else{
          errorMsg = baseResponse.msg;
          _handError(errorCallBack,baseResponse.code, errorMsg);
        }

      }
    } catch (exception) {
      _handError(errorCallBack,-100, exception.toString());
    }
  }

  //处理异常
  void _handError(Function errorCallback,int errCode, String errorMsg) {
    if (errorCallback != null) {
      errorCallback(errorMsg);
    }
    print("<net> errorCode :"+errCode.toString()+",errorMsg :" + errorMsg);
  }

}
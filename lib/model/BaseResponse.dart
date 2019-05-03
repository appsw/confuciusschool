import 'package:json_annotation/json_annotation.dart';

part 'BaseResponse.g.dart';


@JsonSerializable()
class BaseResponse{

  @JsonKey(name: 'msg')
  var msg;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  var data;

  BaseResponse(this.msg,this.code,this.data,);

  factory BaseResponse.fromJson(Map<String, dynamic> srcJson) => _$BaseResponseFromJson(srcJson);

}



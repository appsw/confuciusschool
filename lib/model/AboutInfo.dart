import 'package:json_annotation/json_annotation.dart';

part 'AboutInfo.g.dart';


@JsonSerializable()
class AboutInfo extends Object {

  @JsonKey(name: 'wechatCode')
  String wechatCode;

  @JsonKey(name: 'wechat')
  String wechat;

  @JsonKey(name: 'wechatqq')
  String wechatqq;

  @JsonKey(name: 'qq')
  String qq;

  @JsonKey(name: 'tel')
  String tel;

  AboutInfo(this.wechatCode,this.wechat,this.wechatqq,this.qq,this.tel,);

  factory AboutInfo.fromJson(Map<String, dynamic> srcJson) => _$AboutInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AboutInfoToJson(this);

}



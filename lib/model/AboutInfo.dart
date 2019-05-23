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

  @JsonKey(name: 're')
  Re re;

  AboutInfo(this.wechatCode,this.wechat,this.wechatqq,this.qq,this.tel,this.re,);

  factory AboutInfo.fromJson(Map<String, dynamic> srcJson) => _$AboutInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AboutInfoToJson(this);

}


@JsonSerializable()
class Re extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'explain')
  String explain;

  @JsonKey(name: 'img')
  String img;

  Re(this.title,this.explain,this.img,);

  factory Re.fromJson(Map<String, dynamic> srcJson) => _$ReFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ReToJson(this);

}





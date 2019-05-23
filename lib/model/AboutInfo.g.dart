// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AboutInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutInfo _$AboutInfoFromJson(Map<String, dynamic> json) {
  return AboutInfo(
      json['wechatCode'] as String,
      json['wechat'] as String,
      json['wechatqq'] as String,
      json['qq'] as String,
      json['tel'] as String,
      json['re'] == null
          ? null
          : Re.fromJson(json['re'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AboutInfoToJson(AboutInfo instance) => <String, dynamic>{
      'wechatCode': instance.wechatCode,
      'wechat': instance.wechat,
      'wechatqq': instance.wechatqq,
      'qq': instance.qq,
      'tel': instance.tel,
      're': instance.re
    };

Re _$ReFromJson(Map<String, dynamic> json) {
  return Re(json['title'] as String, json['explain'] as String,
      json['img'] as String);
}

Map<String, dynamic> _$ReToJson(Re instance) => <String, dynamic>{
      'title': instance.title,
      'explain': instance.explain,
      'img': instance.img
    };

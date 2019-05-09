// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BecomeVipInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BecomeVipInfo _$BecomeVipInfoFromJson(Map<String, dynamic> json) {
  return BecomeVipInfo(
      json['account'] as String,
      json['vip'] as String,
      (json['detail'] as List)
          ?.map((e) =>
              e == null ? null : Detail.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$BecomeVipInfoToJson(BecomeVipInfo instance) =>
    <String, dynamic>{
      'account': instance.account,
      'vip': instance.vip,
      'detail': instance.detail
    };

Detail _$DetailFromJson(Map<String, dynamic> json) {
  return Detail(json['title'] as String, json['explain'] as String);
}

Map<String, dynamic> _$DetailToJson(Detail instance) =>
    <String, dynamic>{'title': instance.title, 'explain': instance.explain};

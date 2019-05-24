// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BecomeVipInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BecomeVipInfo _$BecomeVipInfoFromJson(Map<String, dynamic> json) {
  return BecomeVipInfo(json['account'] as String, json['vip'] as String,
      (json['explain'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$BecomeVipInfoToJson(BecomeVipInfo instance) =>
    <String, dynamic>{
      'account': instance.account,
      'vip': instance.vip,
      'explain': instance.explain
    };

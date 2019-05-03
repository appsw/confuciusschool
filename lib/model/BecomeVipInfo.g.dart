// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BecomeVipInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BecomeVipInfo _$BecomeVipInfoFromJson(Map<String, dynamic> json) {
  return BecomeVipInfo(
      json['re'] == null
          ? null
          : Re.fromJson(json['re'] as Map<String, dynamic>),
      json['re2'] as String,
      json['re3'] == null
          ? null
          : Re3.fromJson(json['re3'] as Map<String, dynamic>),
      (json['re4'] as List)
          ?.map(
              (e) => e == null ? null : Re4.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$BecomeVipInfoToJson(BecomeVipInfo instance) =>
    <String, dynamic>{
      're': instance.re,
      're2': instance.re2,
      're3': instance.re3,
      're4': instance.re4
    };

Re _$ReFromJson(Map<String, dynamic> json) {
  return Re(json['account'] as String);
}

Map<String, dynamic> _$ReToJson(Re instance) =>
    <String, dynamic>{'account': instance.account};

Re3 _$Re3FromJson(Map<String, dynamic> json) {
  return Re3(json['paytype'] as int);
}

Map<String, dynamic> _$Re3ToJson(Re3 instance) =>
    <String, dynamic>{'paytype': instance.paytype};

Re4 _$Re4FromJson(Map<String, dynamic> json) {
  return Re4(json['title'] as String, json['explain'] as String);
}

Map<String, dynamic> _$Re4ToJson(Re4 instance) =>
    <String, dynamic>{'title': instance.title, 'explain': instance.explain};

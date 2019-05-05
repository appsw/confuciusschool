// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EntrepreneurshipInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntrepreneurshipInfo _$EntrepreneurshipInfoFromJson(Map<String, dynamic> json) {
  return EntrepreneurshipInfo(
      json['re'] == null
          ? null
          : Re.fromJson(json['re'] as Map<String, dynamic>),
      (json['res'] as List)
          ?.map(
              (e) => e == null ? null : Res.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$EntrepreneurshipInfoToJson(
        EntrepreneurshipInfo instance) =>
    <String, dynamic>{'re': instance.re, 'res': instance.res};

Re _$ReFromJson(Map<String, dynamic> json) {
  return Re(
      json['id'] as int,
      json['comment'] as int,
      json['createTime'] as String,
      json['name'] as String,
      json['fabulous'] as int,
      json['duration'] as String,
      json['address'] as String,
      json['clicks'] as int,
      json['img'] as String);
}

Map<String, dynamic> _$ReToJson(Re instance) => <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'createTime': instance.createTime,
      'name': instance.name,
      'fabulous': instance.fabulous,
      'duration': instance.duration,
      'address': instance.address,
      'clicks': instance.clicks,
      'img': instance.img
    };

Res _$ResFromJson(Map<String, dynamic> json) {
  return Res(
      json['id'] as int,
      json['createTime'] as String,
      json['name'] as String,
      json['duration'] as String,
      json['clicks'] as int);
}

Map<String, dynamic> _$ResToJson(Res instance) => <String, dynamic>{
      'id': instance.id,
      'createTime': instance.createTime,
      'name': instance.name,
      'duration': instance.duration,
      'clicks': instance.clicks
    };

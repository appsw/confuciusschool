// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EntrepreneurialTitleInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntrepreneurialTitleInfo _$EntrepreneurialTitleInfoFromJson(
    Map<String, dynamic> json) {
  return EntrepreneurialTitleInfo(
      json['status'] as int,
      (json['sql'] as List)
          ?.map(
              (e) => e == null ? null : Sql.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['re'] == null
          ? null
          : Re.fromJson(json['re'] as Map<String, dynamic>),
      (json['res'] as List)
          ?.map((e) =>
              e == null ? null : Res1.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$EntrepreneurialTitleInfoToJson(
        EntrepreneurialTitleInfo instance) =>
    <String, dynamic>{
      'status': instance.status,
      'sql': instance.sql,
      're': instance.re,
      'res': instance.res
    };

Sql _$SqlFromJson(Map<String, dynamic> json) {
  return Sql(json['name'] as String, json['id'] as int);
}

Map<String, dynamic> _$SqlToJson(Sql instance) =>
    <String, dynamic>{'name': instance.name, 'id': instance.id};

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

Res1 _$Res1FromJson(Map<String, dynamic> json) {
  return Res1(
      json['id'] as int,
      json['createTime'] as String,
      json['name'] as String,
      json['duration'] as String,
      json['clicks'] as int);
}

Map<String, dynamic> _$Res1ToJson(Res1 instance) => <String, dynamic>{
      'id': instance.id,
      'createTime': instance.createTime,
      'name': instance.name,
      'duration': instance.duration,
      'clicks': instance.clicks
    };

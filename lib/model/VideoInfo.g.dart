// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VideoInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoInfo _$VideoInfoFromJson(Map<String, dynamic> json) {
  return VideoInfo(
      json['re'] == null
          ? null
          : Re.fromJson(json['re'] as Map<String, dynamic>),
      (json['sql'] as List)
          ?.map(
              (e) => e == null ? null : Sql.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$VideoInfoToJson(VideoInfo instance) =>
    <String, dynamic>{'re': instance.re, 'sql': instance.sql};

Re _$ReFromJson(Map<String, dynamic> json) {
  return Re(
      json['fabulous'] as int,
      json['collection'] as int,
      json['id'] as int,
      json['comment'] as int,
      json['vcover'] as String,
      json['address'] as String);
}

Map<String, dynamic> _$ReToJson(Re instance) => <String, dynamic>{
      'fabulous': instance.fabulous,
      'collection': instance.collection,
      'id': instance.id,
      'comment': instance.comment,
      'vcover': instance.vcover,
      'address': instance.address
    };

Sql _$SqlFromJson(Map<String, dynamic> json) {
  return Sql(json['name'] as String, json['createTime'] as String,
      json['clicks'] as int, json['duration'] as String, json['level'] as int);
}

Map<String, dynamic> _$SqlToJson(Sql instance) => <String, dynamic>{
      'name': instance.name,
      'createTime': instance.createTime,
      'clicks': instance.clicks,
      'duration': instance.duration,
      'level': instance.level
    };

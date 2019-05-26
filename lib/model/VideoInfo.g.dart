// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VideoInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoInfo _$VideoInfoFromJson(Map<String, dynamic> json) {
  return VideoInfo(
      json['status'] as int,
      json['state'] as int,
      json['re'] == null
          ? null
          : Re.fromJson(json['re'] as Map<String, dynamic>),
      (json['sql'] as List)
          ?.map(
              (e) => e == null ? null : Sql.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['type'] as int);
}

Map<String, dynamic> _$VideoInfoToJson(VideoInfo instance) => <String, dynamic>{
      'status': instance.status,
      'state': instance.state,
      're': instance.re,
      'sql': instance.sql,
      'type': instance.type
    };

Re _$ReFromJson(Map<String, dynamic> json) {
  return Re(
      json['duration'] as String,
      json['fabulous'] as int,
      json['collection'] as int,
      json['id'] as int,
      json['comment'] as int,
      json['vcover'] as String,
      json['address'] as String);
}

Map<String, dynamic> _$ReToJson(Re instance) => <String, dynamic>{
      'duration': instance.duration,
      'fabulous': instance.fabulous,
      'collection': instance.collection,
      'id': instance.id,
      'comment': instance.comment,
      'vcover': instance.vcover,
      'address': instance.address
    };

Sql _$SqlFromJson(Map<String, dynamic> json) {
  return Sql(
      json['name'] as String,
      json['createTime'] as String,
      json['clicks'] as int,
      json['duration'] as String,
      json['level'] as int,
      json['id'] as int,
      json['currid'] as int,
      json['key'] as int);
}

Map<String, dynamic> _$SqlToJson(Sql instance) => <String, dynamic>{
      'name': instance.name,
      'createTime': instance.createTime,
      'clicks': instance.clicks,
      'duration': instance.duration,
      'level': instance.level,
      'id': instance.id,
      'currid': instance.currid,
      'key': instance.key
    };

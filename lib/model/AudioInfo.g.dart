// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AudioInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioInfo _$AudioInfoFromJson(Map<String, dynamic> json) {
  return AudioInfo(
      (json['sc'] as List)
          ?.map(
              (e) => e == null ? null : Sc.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['res'] as List)
          ?.map(
              (e) => e == null ? null : Res.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['sql'] as List)
          ?.map(
              (e) => e == null ? null : Sql.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['re'] as List)
          ?.map(
              (e) => e == null ? null : Re.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['jr'] as List)
          ?.map(
              (e) => e == null ? null : Jr.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['arr'] as List)
          ?.map(
              (e) => e == null ? null : Arr.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['lb'] as List)
          ?.map(
              (e) => e == null ? null : Lb.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$AudioInfoToJson(AudioInfo instance) => <String, dynamic>{
      'sc': instance.sc,
      'res': instance.res,
      'sql': instance.sql,
      're': instance.re,
      'jr': instance.jr,
      'arr': instance.arr,
      'lb': instance.lb
    };

Sc _$ScFromJson(Map<String, dynamic> json) {
  return Sc(json['id'] as int, json['currid'] as int, json['name'] as String,
      json['hvcover'] as String, json['words'] as String);
}

Map<String, dynamic> _$ScToJson(Sc instance) => <String, dynamic>{
      'id': instance.id,
      'currid': instance.currid,
      'name': instance.name,
      'hvcover': instance.hvcover,
      'words': instance.words
    };

Res _$ResFromJson(Map<String, dynamic> json) {
  return Res(json['id'] as int, json['currid'] as int, json['name'] as String,
      json['hcover'] as String, json['words'] as String);
}

Map<String, dynamic> _$ResToJson(Res instance) => <String, dynamic>{
      'id': instance.id,
      'currid': instance.currid,
      'name': instance.name,
      'hcover': instance.hcover,
      'words': instance.words
    };

Sql _$SqlFromJson(Map<String, dynamic> json) {
  return Sql(json['id'] as int, json['name'] as String, json['currid'] as int,
      json['hcover'] as String, json['clicks'] as int, json['words'] as String);
}

Map<String, dynamic> _$SqlToJson(Sql instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'currid': instance.currid,
      'hcover': instance.hcover,
      'clicks': instance.clicks,
      'words': instance.words
    };

Re _$ReFromJson(Map<String, dynamic> json) {
  return Re(json['id'] as int, json['currid'] as int, json['name'] as String,
      json['hcover'] as String, json['clicks'] as int);
}

Map<String, dynamic> _$ReToJson(Re instance) => <String, dynamic>{
      'id': instance.id,
      'currid': instance.currid,
      'name': instance.name,
      'hcover': instance.hcover,
      'clicks': instance.clicks
    };

Jr _$JrFromJson(Map<String, dynamic> json) {
  return Jr(json['id'] as int, json['currid'] as int, json['hcover'] as String,
      json['address'] as String);
}

Map<String, dynamic> _$JrToJson(Jr instance) => <String, dynamic>{
      'id': instance.id,
      'currid': instance.currid,
      'hcover': instance.hcover,
      'address': instance.address
    };

Arr _$ArrFromJson(Map<String, dynamic> json) {
  return Arr(json['id'] as int, json['currid'] as int, json['name'] as String,
      json['hcover'] as String, json['clicks'] as int);
}

Map<String, dynamic> _$ArrToJson(Arr instance) => <String, dynamic>{
      'id': instance.id,
      'currid': instance.currid,
      'name': instance.name,
      'hcover': instance.hcover,
      'clicks': instance.clicks
    };

Lb _$LbFromJson(Map<String, dynamic> json) {
  return Lb(json['id'] as int, json['currid'] as int, json['img'] as String,
      json['pid'] as int);
}

Map<String, dynamic> _$LbToJson(Lb instance) => <String, dynamic>{
      'id': instance.id,
      'currid': instance.currid,
      'img': instance.img,
      'pid': instance.pid
    };

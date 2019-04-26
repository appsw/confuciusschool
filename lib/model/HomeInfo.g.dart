// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeInfo _$HomeInfoFromJson(Map<String, dynamic> json) {
  return HomeInfo(
      (json['ds'] as List)
          ?.map(
              (e) => e == null ? null : Ds.fromJson(e as Map<String, dynamic>))
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
      (json['lb'] as List)
          ?.map(
              (e) => e == null ? null : Lb.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HomeInfoToJson(HomeInfo instance) => <String, dynamic>{
      'ds': instance.ds,
      'res': instance.res,
      'sql': instance.sql,
      're': instance.re,
      'jr': instance.jr,
      'lb': instance.lb
    };

Ds _$DsFromJson(Map<String, dynamic> json) {
  return Ds(json['id'] as int, json['name'] as String, json['hcover'] as String,
      json['words'] as String);
}

Map<String, dynamic> _$DsToJson(Ds instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hcover': instance.hcover,
      'words': instance.words
    };

Res _$ResFromJson(Map<String, dynamic> json) {
  return Res(json['id'] as int, json['name'] as String,
      json['hcover'] as String, json['words'] as String);
}

Map<String, dynamic> _$ResToJson(Res instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hcover': instance.hcover,
      'words': instance.words
    };

Sql _$SqlFromJson(Map<String, dynamic> json) {
  return Sql(json['id'] as int, json['name'] as String,
      json['hcover'] as String, json['words'] as String, json['clicks'] as int);
}

Map<String, dynamic> _$SqlToJson(Sql instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hcover': instance.hcover,
      'words': instance.words,
      'clicks': instance.clicks
    };

Re _$ReFromJson(Map<String, dynamic> json) {
  return Re(json['id'] as int, json['name'] as String, json['hcover'] as String,
      json['clicks'] as int);
}

Map<String, dynamic> _$ReToJson(Re instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hcover': instance.hcover,
      'clicks': instance.clicks
    };

Jr _$JrFromJson(Map<String, dynamic> json) {
  return Jr(json['id'] as int, json['vcover'] as String,
      json['address'] as String, json['hcover'] as String);
}

Map<String, dynamic> _$JrToJson(Jr instance) => <String, dynamic>{
      'id': instance.id,
      'vcover': instance.vcover,
      'address': instance.address,
      'hcover': instance.hcover
    };

Lb _$LbFromJson(Map<String, dynamic> json) {
  return Lb(json['img'] as String, json['id'] as int);
}

Map<String, dynamic> _$LbToJson(Lb instance) =>
    <String, dynamic>{'img': instance.img, 'id': instance.id};

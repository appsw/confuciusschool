// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SignInShowInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInShowInfo _$SignInShowInfoFromJson(Map<String, dynamic> json) {
  return SignInShowInfo(
      json['sql'] == null
          ? null
          : Sql.fromJson(json['sql'] as Map<String, dynamic>),
      json['time'] as String,
      json['week'] as String);
}

Map<String, dynamic> _$SignInShowInfoToJson(SignInShowInfo instance) =>
    <String, dynamic>{
      'sql': instance.sql,
      'time': instance.time,
      'week': instance.week
    };

Sql _$SqlFromJson(Map<String, dynamic> json) {
  return Sql(json['img'] as String, json['words'] as String,
      json['brand'] as String, json['rimg'] as String);
}

Map<String, dynamic> _$SqlToJson(Sql instance) => <String, dynamic>{
      'img': instance.img,
      'words': instance.words,
      'brand': instance.brand,
      'rimg': instance.rimg
    };

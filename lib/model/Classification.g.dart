// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Classification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Classification _$ClassificationFromJson(Map<String, dynamic> json) {
  return Classification(
      json['id'] as int,
      json['name'] as String,
      json['currid'] as int,
      json['fcover'] as String,
      json['clicks'] as int,
      json['level'] as int,
      json['lecturer'] as String,
      json['createTime'] as String,
      json['words'] as String);
}

Map<String, dynamic> _$ClassificationToJson(Classification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'currid': instance.currid,
      'fcover': instance.fcover,
      'clicks': instance.clicks,
      'level': instance.level,
      'lecturer': instance.lecturer,
      'createTime': instance.createTime,
      'words': instance.words
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ActivityInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityInfo _$ActivityInfoFromJson(Map<String, dynamic> json) {
  return ActivityInfo((json['sql'] as List)
      ?.map((e) => e == null ? null : Sql.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ActivityInfoToJson(ActivityInfo instance) =>
    <String, dynamic>{'sql': instance.sql};

Sql _$SqlFromJson(Map<String, dynamic> json) {
  return Sql(json['id'] as int, json['title'] as String, json['img'] as String);
}

Map<String, dynamic> _$SqlToJson(Sql instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'img': instance.img
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ActivityDetailsInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityDetailsInfo _$ActivityDetailsInfoFromJson(Map<String, dynamic> json) {
  return ActivityDetailsInfo(json['sql'] == null
      ? null
      : Sql.fromJson(json['sql'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ActivityDetailsInfoToJson(
        ActivityDetailsInfo instance) =>
    <String, dynamic>{'sql': instance.sql};

Sql _$SqlFromJson(Map<String, dynamic> json) {
  return Sql(json['title'] as String, json['explain'] as String,
      json['img'] as String, json['uedtext'] as String);
}

Map<String, dynamic> _$SqlToJson(Sql instance) => <String, dynamic>{
      'title': instance.title,
      'explain': instance.explain,
      'img': instance.img,
      'uedtext': instance.uedtext
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ActivityDetailsInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityDetailsInfo _$ActivityDetailsInfoFromJson(Map<String, dynamic> json) {
  return ActivityDetailsInfo(
      json['id'] as int,
      json['title'] as String,
      json['explain'] as String,
      json['img'] as String,
      json['uedtext'] as String);
}

Map<String, dynamic> _$ActivityDetailsInfoToJson(
        ActivityDetailsInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'explain': instance.explain,
      'img': instance.img,
      'uedtext': instance.uedtext
    };

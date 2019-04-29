// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NewsInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsInfo _$NewsInfoFromJson(Map<String, dynamic> json) {
  return NewsInfo(json['id'] as int, json['type'] as int,
      json['ititle'] as String, json['about'] as String, json['currid'] as int);
}

Map<String, dynamic> _$NewsInfoToJson(NewsInfo instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'ititle': instance.ititle,
      'about': instance.about,
      'currid': instance.currid
    };

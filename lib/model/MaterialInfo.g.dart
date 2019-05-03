// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MaterialInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialInfo _$MaterialInfoFromJson(Map<String, dynamic> json) {
  return MaterialInfo(
      json['id'] as int,
      json['name'] as String,
      json['photo'] as String,
      json['zed'] as String,
      json['iid'] as int,
      json['mname'] as String,
      json['type'] as int,
      json['describe'] as String,
      json['updateTime'] as String,
      json['fnum'] as int,
      json['time'] as String);
}

Map<String, dynamic> _$MaterialInfoToJson(MaterialInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'zed': instance.zed,
      'iid': instance.iid,
      'mname': instance.mname,
      'type': instance.type,
      'describe': instance.describe,
      'updateTime': instance.updateTime,
      'fnum': instance.fnum,
      'time': instance.time
    };

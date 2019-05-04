// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyCollectionInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCollectionInfo _$MyCollectionInfoFromJson(Map<String, dynamic> json) {
  return MyCollectionInfo((json['arr'] as List)
      ?.map((e) => e == null ? null : Arr.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$MyCollectionInfoToJson(MyCollectionInfo instance) =>
    <String, dynamic>{'arr': instance.arr};

Arr _$ArrFromJson(Map<String, dynamic> json) {
  return Arr(
      json['id'] as int,
      json['name'] as String,
      json['photo'] as String,
      json['zed'] as String,
      json['iid'] as int,
      json['mname'] as String,
      json['type'] as int,
      json['video'] as String,
      json['describe'] as String,
      json['createTime'] as String,
      json['updateTime'] as String,
      json['time'] as String);
}

Map<String, dynamic> _$ArrToJson(Arr instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'zed': instance.zed,
      'iid': instance.iid,
      'mname': instance.mname,
      'type': instance.type,
      'video': instance.video,
      'describe': instance.describe,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'time': instance.time
    };

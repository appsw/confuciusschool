// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CourseInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseInfo _$CourseInfoFromJson(Map<String, dynamic> json) {
  return CourseInfo(
      json['id'] as int,
      json['name'] as String,
      json['photo'] as String,
      json['createTime'] as String,
      json['zed'] as String,
      json['words'] as String,
      json['pwords'] as String,
      json['type'] as int,
      json['pid'] as String,
      json['fnum'] as int,
      json['fcover'] as String,
      json['currid'] as int,
      json['pname'] as String,
      json['time'] as String,
      json['status'] as int);
}

Map<String, dynamic> _$CourseInfoToJson(CourseInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'createTime': instance.createTime,
      'zed': instance.zed,
      'words': instance.words,
      'pwords': instance.pwords,
      'type': instance.type,
      'pid': instance.pid,
      'fnum': instance.fnum,
      'fcover': instance.fcover,
      'currid': instance.currid,
      'pname': instance.pname,
      'time': instance.time,
      'status': instance.status
    };

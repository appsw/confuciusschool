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
      json['zed'] as String,
      json['userid'] as int,
      json['cname'] as String,
      json['words'] as String,
      json['type'] as int,
      json['pid'] as int,
      json['createTime'] as String,
      json['updateTime'] as String,
      json['fnum'] as int,
      json['img'] as String,
      json['time'] as String,
      json['status'] as int,
      json['currid'] as int);
}

Map<String, dynamic> _$CourseInfoToJson(CourseInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'zed': instance.zed,
      'userid': instance.userid,
      'cname': instance.cname,
      'words': instance.words,
      'type': instance.type,
      'pid': instance.pid,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'fnum': instance.fnum,
      'img': instance.img,
      'time': instance.time,
      'status': instance.status,
      'currid': instance.currid
    };

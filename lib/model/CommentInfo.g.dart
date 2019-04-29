// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommentInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentInfo _$CommentInfoFromJson(Map<String, dynamic> json) {
  return CommentInfo(
      json['id'] as int,
      json['nickName'] as String,
      json['profilePhoto'] as String,
      json['content'] as String,
      json['zan_count'] as int,
      json['createTime'] as String,
      json['type'] as int,
      (json['replay'] as List)
          ?.map((e) =>
              e == null ? null : Replay.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CommentInfoToJson(CommentInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickName': instance.nickName,
      'profilePhoto': instance.profilePhoto,
      'content': instance.content,
      'zan_count': instance.zanCount,
      'createTime': instance.createTime,
      'type': instance.type,
      'replay': instance.replay
    };

Replay _$ReplayFromJson(Map<String, dynamic> json) {
  return Replay(json['nickName'] as String, json['profilePhoto'] as String,
      json['deatil'] as String);
}

Map<String, dynamic> _$ReplayToJson(Replay instance) => <String, dynamic>{
      'nickName': instance.nickName,
      'profilePhoto': instance.profilePhoto,
      'deatil': instance.deatil
    };

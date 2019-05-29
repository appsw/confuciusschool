// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShareInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareInfo _$ShareInfoFromJson(Map<String, dynamic> json) {
  return ShareInfo(
      json['invitecode'] as String,
      json['re'] == null
          ? null
          : Re.fromJson(json['re'] as Map<String, dynamic>),
      json['nickName'] as String,
      json['profilePhoto'] as String);
}

Map<String, dynamic> _$ShareInfoToJson(ShareInfo instance) => <String, dynamic>{
      'invitecode': instance.invitecode,
      're': instance.re,
      'nickName': instance.nickName,
      'profilePhoto': instance.profilePhoto
    };

Re _$ReFromJson(Map<String, dynamic> json) {
  return Re(
      json['id'] as int,
      json['words'] as String,
      json['vcover'] as String,
      json['address'] as String,
      json['name'] as String,
      json['currid'] as int);
}

Map<String, dynamic> _$ReToJson(Re instance) => <String, dynamic>{
      'id': instance.id,
      'words': instance.words,
      'vcover': instance.vcover,
      'address': instance.address,
      'name': instance.name,
      'currid': instance.currid
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PersonalInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) {
  return PersonalInfo(
      json['nickName'] as String,
      json['profilePhoto'] as String,
      json['account'] as String,
      json['sex'] as int,
      json['birth'] as String,
      json['bname'] as String,
      json['dname'] as String,
      json['ename'] as String,
      json['bid'] as int,
      json['did'] as int,
      json['eid'] as int,
      json['invitecode'] as String);
}

Map<String, dynamic> _$PersonalInfoToJson(PersonalInfo instance) =>
    <String, dynamic>{
      'nickName': instance.nickName,
      'profilePhoto': instance.profilePhoto,
      'account': instance.account,
      'sex': instance.sex,
      'birth': instance.birth,
      'bname': instance.bname,
      'dname': instance.dname,
      'ename': instance.ename,
      'bid': instance.bid,
      'did': instance.did,
      'eid': instance.eid,
      'invitecode': instance.invitecode
    };

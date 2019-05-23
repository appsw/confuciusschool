// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MemberInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberInfo _$MemberInfoFromJson(Map<String, dynamic> json) {
  return MemberInfo(
      json['num'] as String,
      json['balance'] as String,
      json['overTime'] as String,
      json['list'] == null
          ? null
          : List1.fromJson(json['list'] as Map<String, dynamic>));
}

Map<String, dynamic> _$MemberInfoToJson(MemberInfo instance) =>
    <String, dynamic>{
      'num': instance.num,
      'balance': instance.balance,
      'overTime': instance.overTime,
      'list': instance.list
    };

List1 _$List1FromJson(Map<String, dynamic> json) {
  return List1(
      json['nickName'] as String,
      json['IsVip'] as int,
      json['profilePhoto'] as String,
      json['invitecode'] as String,
      json['integral'] as String,
      json['isAgent'] as int,
      json['sex'] as int);
}

Map<String, dynamic> _$List1ToJson(List1 instance) => <String, dynamic>{
      'nickName': instance.nickName,
      'IsVip': instance.isVip,
      'profilePhoto': instance.profilePhoto,
      'invitecode': instance.invitecode,
      'integral': instance.integral,
      'isAgent': instance.isAgent,
      'sex': instance.sex
    };

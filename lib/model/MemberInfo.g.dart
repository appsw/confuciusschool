// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MemberInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberInfo _$MemberInfoFromJson(Map<String, dynamic> json) {
  return MemberInfo(json['list'] == null
      ? null
      : Listinfo.fromJson(json['list'] as Map<String, dynamic>));
}

Map<String, dynamic> _$MemberInfoToJson(MemberInfo instance) =>
    <String, dynamic>{'list': instance.listinfo};

Listinfo _$ListinfoFromJson(Map<String, dynamic> json) {
  return Listinfo(
      json['nickName'] as String,
      json['IsVip'] as int,
      json['profilePhoto'] as String,
      json['invitecode'] as String,
      json['balance'] as String);
}

Map<String, dynamic> _$ListinfoToJson(Listinfo instance) => <String, dynamic>{
      'nickName': instance.nickName,
      'IsVip': instance.isVip,
      'profilePhoto': instance.profilePhoto,
      'invitecode': instance.invitecode,
      'balance': instance.balance
    };

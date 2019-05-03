// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyTeamMemberInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyTeamMemberInfo _$MyTeamMemberInfoFromJson(Map<String, dynamic> json) {
  return MyTeamMemberInfo((json['res'] as List)
      ?.map((e) => e == null ? null : Res.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$MyTeamMemberInfoToJson(MyTeamMemberInfo instance) =>
    <String, dynamic>{'res': instance.res};

Res _$ResFromJson(Map<String, dynamic> json) {
  return Res(json['nickName'] as String, json['profilePhoto'] as String,
      json['account'] as String, json['createTime'] as String);
}

Map<String, dynamic> _$ResToJson(Res instance) => <String, dynamic>{
      'nickName': instance.nickName,
      'profilePhoto': instance.profilePhoto,
      'account': instance.account,
      'createTime': instance.createTime
    };

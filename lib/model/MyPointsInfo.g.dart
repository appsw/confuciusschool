// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyPointsInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPointsInfo _$MyPointsInfoFromJson(Map<String, dynamic> json) {
  return MyPointsInfo(
      json['re'] as String,
      (json['sql'] as List)
          ?.map(
              (e) => e == null ? null : Sql.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MyPointsInfoToJson(MyPointsInfo instance) =>
    <String, dynamic>{'re': instance.re, 'sql': instance.sql};

Sql _$SqlFromJson(Map<String, dynamic> json) {
  return Sql(json['type'] as int, json['pointsum'] as int,
      json['createTime'] as String);
}

Map<String, dynamic> _$SqlToJson(Sql instance) => <String, dynamic>{
      'type': instance.type,
      'pointsum': instance.pointsum,
      'createTime': instance.createTime
    };

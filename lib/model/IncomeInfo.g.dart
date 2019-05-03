// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IncomeInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncomeInfo _$IncomeInfoFromJson(Map<String, dynamic> json) {
  return IncomeInfo(json['total'] as String, json['after'] as String,
      json['createTime'] as String);
}

Map<String, dynamic> _$IncomeInfoToJson(IncomeInfo instance) =>
    <String, dynamic>{
      'total': instance.total,
      'after': instance.after,
      'createTime': instance.createTime
    };

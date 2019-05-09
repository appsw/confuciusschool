// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BankInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankInfo _$BankInfoFromJson(Map<String, dynamic> json) {
  return BankInfo(json['bankId'] as int, json['bankName'] as String);
}

Map<String, dynamic> _$BankInfoToJson(BankInfo instance) =>
    <String, dynamic>{'bankId': instance.bankId, 'bankName': instance.bankName};

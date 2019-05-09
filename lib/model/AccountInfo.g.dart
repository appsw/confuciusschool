// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccountInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountInfo _$AccountInfoFromJson(Map<String, dynamic> json) {
  return AccountInfo(json['balance'] as String, json['gross'] as String,
      json['isAgent'] as int, json['arr'] as int);
}

Map<String, dynamic> _$AccountInfoToJson(AccountInfo instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'gross': instance.gross,
      'isAgent': instance.isAgent,
      'arr': instance.arr
    };

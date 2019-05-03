// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccountInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountInfo _$AccountInfoFromJson(Map<String, dynamic> json) {
  return AccountInfo(
      json['ar'] == null
          ? null
          : Ar.fromJson(json['ar'] as Map<String, dynamic>),
      json['arr'] as int);
}

Map<String, dynamic> _$AccountInfoToJson(AccountInfo instance) =>
    <String, dynamic>{'ar': instance.ar, 'arr': instance.arr};

Ar _$ArFromJson(Map<String, dynamic> json) {
  return Ar(json['balance'] as String, json['gross'] as String);
}

Map<String, dynamic> _$ArToJson(Ar instance) =>
    <String, dynamic>{'balance': instance.balance, 'gross': instance.gross};

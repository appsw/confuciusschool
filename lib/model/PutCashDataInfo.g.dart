// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PutCashDataInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PutCashDataInfo _$PutCashDataInfoFromJson(Map<String, dynamic> json) {
  return PutCashDataInfo(
      (json['bank'] as List)
          ?.map((e) =>
              e == null ? null : Bank.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['mem'] == null
          ? null
          : Mem.fromJson(json['mem'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PutCashDataInfoToJson(PutCashDataInfo instance) =>
    <String, dynamic>{'bank': instance.bank, 'mem': instance.mem};

Bank _$BankFromJson(Map<String, dynamic> json) {
  return Bank(
      json['id'] as int,
      json['bname'] as String,
      json['deposit'] as String,
      json['bankName'] as String,
      json['banknum'] as String,
      json['img'] as String);
}

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'id': instance.id,
      'bname': instance.bname,
      'deposit': instance.deposit,
      'bankName': instance.bankName,
      'banknum': instance.banknum,
      'img': instance.img
    };

Mem _$MemFromJson(Map<String, dynamic> json) {
  return Mem(json['balance'] as String);
}

Map<String, dynamic> _$MemToJson(Mem instance) =>
    <String, dynamic>{'balance': instance.balance};

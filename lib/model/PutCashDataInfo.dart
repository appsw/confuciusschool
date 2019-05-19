import 'package:json_annotation/json_annotation.dart';

part 'PutCashDataInfo.g.dart';


@JsonSerializable()
class PutCashDataInfo extends Object {

  @JsonKey(name: 'bank')
  List<Bank> bank;

  @JsonKey(name: 'mem')
  Mem mem;

  PutCashDataInfo(this.bank,this.mem,);

  factory PutCashDataInfo.fromJson(Map<String, dynamic> srcJson) => _$PutCashDataInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PutCashDataInfoToJson(this);

}


@JsonSerializable()
class Bank extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'bname')
  String bname;

  @JsonKey(name: 'deposit')
  String deposit;

  @JsonKey(name: 'bankName')
  String bankName;

  @JsonKey(name: 'banknum')
  String banknum;

  @JsonKey(name: 'img')
  String img;

  Bank(this.id,this.bname,this.deposit,this.bankName,this.banknum,this.img,);

  factory Bank.fromJson(Map<String, dynamic> srcJson) => _$BankFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BankToJson(this);

}


@JsonSerializable()
class Mem extends Object {

  @JsonKey(name: 'balance')
  String balance;

  Mem(this.balance,);

  factory Mem.fromJson(Map<String, dynamic> srcJson) => _$MemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MemToJson(this);

}



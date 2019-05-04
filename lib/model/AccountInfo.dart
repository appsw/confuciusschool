import 'package:json_annotation/json_annotation.dart';

part 'AccountInfo.g.dart';

@JsonSerializable()
class AccountInfo extends Object {

  @JsonKey(name: 'ar')
  Ar ar;

  @JsonKey(name: 'arr')
  int arr;

  AccountInfo(this.ar,this.arr,);

  factory AccountInfo.fromJson(Map<String, dynamic> srcJson) => _$AccountInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AccountInfoToJson(this);

}


@JsonSerializable()
class Ar extends Object {

  @JsonKey(name: 'balance')
  String balance;

  @JsonKey(name: 'gross')
  String gross;

  Ar(this.balance,this.gross,);

  factory Ar.fromJson(Map<String, dynamic> srcJson) => _$ArFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArToJson(this);

}


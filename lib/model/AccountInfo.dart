import 'package:json_annotation/json_annotation.dart';

part 'AccountInfo.g.dart';

@JsonSerializable()
class AccountInfo extends Object {

  @JsonKey(name: 'balance')
  String balance;

  @JsonKey(name: 'gross')
  String gross;

  @JsonKey(name: 'isAgent')
  int isAgent;

  @JsonKey(name: 'sale')
  int arr;

  AccountInfo(this.balance,this.gross,this.isAgent,this.arr,);

  factory AccountInfo.fromJson(Map<String, dynamic> srcJson) => _$AccountInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AccountInfoToJson(this);

}





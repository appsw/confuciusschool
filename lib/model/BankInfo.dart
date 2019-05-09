import 'package:json_annotation/json_annotation.dart';

part 'BankInfo.g.dart';


List<BankInfo> getBankInfoList(List<dynamic> list){
  List<BankInfo> result = [];
  list.forEach((item){
    result.add(BankInfo.fromJson(item));
  });
  return result;
}
@JsonSerializable()
class BankInfo extends Object {

  @JsonKey(name: 'bankId')
  int bankId;

  @JsonKey(name: 'bankName')
  String bankName;

  BankInfo(this.bankId,this.bankName,);

  factory BankInfo.fromJson(Map<String, dynamic> srcJson) => _$BankInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BankInfoToJson(this);

}
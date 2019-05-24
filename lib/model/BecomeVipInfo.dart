import 'package:json_annotation/json_annotation.dart';

part 'BecomeVipInfo.g.dart';


@JsonSerializable()
class BecomeVipInfo extends Object {

  @JsonKey(name: 'account')
  String account;

  @JsonKey(name: 'vip')
  String vip;

  @JsonKey(name: 'explain')
  List<String> explain;

  BecomeVipInfo(this.account,this.vip,this.explain,);

  factory BecomeVipInfo.fromJson(Map<String, dynamic> srcJson) => _$BecomeVipInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BecomeVipInfoToJson(this);

}






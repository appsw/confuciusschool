import 'package:json_annotation/json_annotation.dart';

part 'BecomeVipInfo.g.dart';


@JsonSerializable()
class BecomeVipInfo extends Object {

  @JsonKey(name: 'account')
  String account;

  @JsonKey(name: 'vip')
  String vip;

  @JsonKey(name: 'detail')
  List<Detail> detail;

  BecomeVipInfo(this.account,this.vip,this.detail,);

  factory BecomeVipInfo.fromJson(Map<String, dynamic> srcJson) => _$BecomeVipInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BecomeVipInfoToJson(this);

}


@JsonSerializable()
class Detail extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'explain')
  String explain;

  Detail(this.title,this.explain,);

  factory Detail.fromJson(Map<String, dynamic> srcJson) => _$DetailFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DetailToJson(this);

}






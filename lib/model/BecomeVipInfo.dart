import 'package:json_annotation/json_annotation.dart';

part 'BecomeVipInfo.g.dart';


@JsonSerializable()
class BecomeVipInfo extends Object {

  @JsonKey(name: 're')
  Re re;

  @JsonKey(name: 're2')
  String re2;

  @JsonKey(name: 're3')
  Re3 re3;

  @JsonKey(name: 're4')
  List<Re4> re4;

  BecomeVipInfo(this.re,this.re2,this.re3,this.re4,);

  factory BecomeVipInfo.fromJson(Map<String, dynamic> srcJson) => _$BecomeVipInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BecomeVipInfoToJson(this);

}


@JsonSerializable()
class Re extends Object {

  @JsonKey(name: 'account')
  String account;

  Re(this.account,);

  factory Re.fromJson(Map<String, dynamic> srcJson) => _$ReFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ReToJson(this);

}


@JsonSerializable()
class Re3 extends Object {

  @JsonKey(name: 'paytype')
  int paytype;

  Re3(this.paytype,);

  factory Re3.fromJson(Map<String, dynamic> srcJson) => _$Re3FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Re3ToJson(this);

}


@JsonSerializable()
class Re4 extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'explain')
  String explain;

  Re4(this.title,this.explain,);

  factory Re4.fromJson(Map<String, dynamic> srcJson) => _$Re4FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Re4ToJson(this);

}



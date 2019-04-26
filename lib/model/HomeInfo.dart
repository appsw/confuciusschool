import 'package:json_annotation/json_annotation.dart';

part 'HomeInfo.g.dart';


@JsonSerializable()
class HomeInfo extends Object {

  @JsonKey(name: 'ds')
  List<Ds> ds;

  @JsonKey(name: 'res')
  List<Res> res;

  @JsonKey(name: 'sql')
  List<Sql> sql;

  @JsonKey(name: 're')
  List<Re> re;

  @JsonKey(name: 'jr')
  List<Jr> jr;

  @JsonKey(name: 'lb')
  List<Lb> lb;

  HomeInfo(this.ds,this.res,this.sql,this.re,this.jr,this.lb,);

  factory HomeInfo.fromJson(Map<String, dynamic> srcJson) => _$HomeInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeInfoToJson(this);

}


@JsonSerializable()
class Ds extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'hcover')
  String hcover;

  @JsonKey(name: 'words')
  String words;

  Ds(this.id,this.name,this.hcover,this.words,);

  factory Ds.fromJson(Map<String, dynamic> srcJson) => _$DsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DsToJson(this);

}


@JsonSerializable()
class Res extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'hcover')
  String hcover;

  @JsonKey(name: 'words')
  String words;

  Res(this.id,this.name,this.hcover,this.words,);

  factory Res.fromJson(Map<String, dynamic> srcJson) => _$ResFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResToJson(this);

}


@JsonSerializable()
class Sql extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'hcover')
  String hcover;

  @JsonKey(name: 'words')
  String words;

  @JsonKey(name: 'clicks')
  int clicks;

  Sql(this.id,this.name,this.hcover,this.words,this.clicks,);

  factory Sql.fromJson(Map<String, dynamic> srcJson) => _$SqlFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SqlToJson(this);

}


@JsonSerializable()
class Re extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'hcover')
  String hcover;

  @JsonKey(name: 'clicks')
  int clicks;

  Re(this.id,this.name,this.hcover,this.clicks,);

  factory Re.fromJson(Map<String, dynamic> srcJson) => _$ReFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ReToJson(this);

}


@JsonSerializable()
class Jr extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'vcover')
  String vcover;

  @JsonKey(name: 'address')
  String address;

  @JsonKey(name: 'hcover')
  String hcover;

  Jr(this.id,this.vcover,this.address,this.hcover,);

  factory Jr.fromJson(Map<String, dynamic> srcJson) => _$JrFromJson(srcJson);

  Map<String, dynamic> toJson() => _$JrToJson(this);

}


@JsonSerializable()
class Lb extends Object {

  @JsonKey(name: 'img')
  String img;

  @JsonKey(name: 'id')
  int id;

  Lb(this.img,this.id,);

  factory Lb.fromJson(Map<String, dynamic> srcJson) => _$LbFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LbToJson(this);

}



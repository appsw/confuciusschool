import 'package:json_annotation/json_annotation.dart';

part 'EntrepreneurialTitleInfo.g.dart';


@JsonSerializable()
class EntrepreneurialTitleInfo extends Object {

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'sql')
  List<Sql> sql;

  @JsonKey(name: 're')
  Re re;

  @JsonKey(name: 'res')
  List<Res1> res;

  EntrepreneurialTitleInfo(this.status,this.sql,this.re,this.res,);

  factory EntrepreneurialTitleInfo.fromJson(Map<String, dynamic> srcJson) => _$EntrepreneurialTitleInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EntrepreneurialTitleInfoToJson(this);

}


@JsonSerializable()
class Sql extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  int id;

  Sql(this.name,this.id,);

  factory Sql.fromJson(Map<String, dynamic> srcJson) => _$SqlFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SqlToJson(this);

}


@JsonSerializable()
class Re extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'comment')
  int comment;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'fabulous')
  int fabulous;

  @JsonKey(name: 'duration')
  String duration;

  @JsonKey(name: 'address')
  String address;

  @JsonKey(name: 'clicks')
  int clicks;

  @JsonKey(name: 'img')
  String img;

  Re(this.id,this.comment,this.createTime,this.name,this.fabulous,this.duration,this.address,this.clicks,this.img,);

  factory Re.fromJson(Map<String, dynamic> srcJson) => _$ReFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ReToJson(this);

}


@JsonSerializable()
class Res1 extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'duration')
  String duration;

  @JsonKey(name: 'clicks')
  int clicks;

  Res1(this.id,this.createTime,this.name,this.duration,this.clicks,);

  factory Res1.fromJson(Map<String, dynamic> srcJson) => _$Res1FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Res1ToJson(this);

}
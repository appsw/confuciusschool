import 'package:json_annotation/json_annotation.dart';

part 'VideoInfo.g.dart';


@JsonSerializable()
class VideoInfo extends Object {

  @JsonKey(name: 're')
  Re re;

  @JsonKey(name: 'sql')
  List<Sql> sql;

  VideoInfo(this.re,this.sql,);

  factory VideoInfo.fromJson(Map<String, dynamic> srcJson) => _$VideoInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideoInfoToJson(this);

}


@JsonSerializable()
class Re extends Object {

  @JsonKey(name: 'fabulous')
  int fabulous;

  @JsonKey(name: 'collection')
  int collection;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'comment')
  int comment;

  @JsonKey(name: 'vcover')
  String vcover;

  @JsonKey(name: 'address')
  String address;

  Re(this.fabulous,this.collection,this.id,this.comment,this.vcover,this.address,);

  factory Re.fromJson(Map<String, dynamic> srcJson) => _$ReFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ReToJson(this);

}


@JsonSerializable()
class Sql extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'clicks')
  int clicks;

  @JsonKey(name: 'duration')
  String duration;

  @JsonKey(name: 'level')
  int level;

  Sql(this.name,this.createTime,this.clicks,this.duration,this.level);

  factory Sql.fromJson(Map<String, dynamic> srcJson) => _$SqlFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SqlToJson(this);

}

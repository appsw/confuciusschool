import 'package:json_annotation/json_annotation.dart';

part 'EntrepreneurshipInfo.g.dart';


@JsonSerializable()
class EntrepreneurshipInfo extends Object {

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 're')
  Re re;

  @JsonKey(name: 'res')
  List<Res> res;

  EntrepreneurshipInfo(this.status,this.re,this.res,);

  factory EntrepreneurshipInfo.fromJson(Map<String, dynamic> srcJson) => _$EntrepreneurshipInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EntrepreneurshipInfoToJson(this);

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
class Res extends Object {

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

  @JsonKey(name: 'key')
  int key;

  Res(this.id,this.createTime,this.name,this.duration,this.clicks,this.key);

  factory Res.fromJson(Map<String, dynamic> srcJson) => _$ResFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResToJson(this);

}




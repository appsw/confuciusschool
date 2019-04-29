import 'package:json_annotation/json_annotation.dart';

part 'AudioInfo.g.dart';


@JsonSerializable()
class AudioInfo extends Object {

  @JsonKey(name: 'sc')
  List<Sc> sc;

  @JsonKey(name: 'res')
  List<Res> res;

  @JsonKey(name: 'sql')
  List<Sql> sql;

  @JsonKey(name: 're')
  List<Re> re;

  @JsonKey(name: 'jr')
  List<Jr> jr;

  @JsonKey(name: 'arr')
  List<Arr> arr;

  @JsonKey(name: 'lb')
  List<Lb> lb;

  AudioInfo(this.sc,this.res,this.sql,this.re,this.jr,this.arr,this.lb,);

  factory AudioInfo.fromJson(Map<String, dynamic> srcJson) => _$AudioInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AudioInfoToJson(this);

}


@JsonSerializable()
class Sc extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'currid')
  int currid;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'hvcover')
  String hvcover;

  @JsonKey(name: 'words')
  String words;

  Sc(this.id,this.currid,this.name,this.hvcover,this.words,);

  factory Sc.fromJson(Map<String, dynamic> srcJson) => _$ScFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ScToJson(this);

}


@JsonSerializable()
class Res extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'currid')
  int currid;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'hcover')
  String hcover;

  @JsonKey(name: 'words')
  String words;

  Res(this.id,this.currid,this.name,this.hcover,this.words,);

  factory Res.fromJson(Map<String, dynamic> srcJson) => _$ResFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResToJson(this);

}


@JsonSerializable()
class Sql extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'currid')
  int currid;

  @JsonKey(name: 'hcover')
  String hcover;

  @JsonKey(name: 'clicks')
  int clicks;

  @JsonKey(name: 'words')
  String words;

  Sql(this.id,this.name,this.currid,this.hcover,this.clicks,this.words,);

  factory Sql.fromJson(Map<String, dynamic> srcJson) => _$SqlFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SqlToJson(this);

}


@JsonSerializable()
class Re extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'currid')
  int currid;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'hcover')
  String hcover;

  @JsonKey(name: 'clicks')
  int clicks;

  Re(this.id,this.currid,this.name,this.hcover,this.clicks,);

  factory Re.fromJson(Map<String, dynamic> srcJson) => _$ReFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ReToJson(this);

}


@JsonSerializable()
class Jr extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'currid')
  int currid;

  @JsonKey(name: 'hcover')
  String hcover;

  @JsonKey(name: 'address')
  String address;

  Jr(this.id,this.currid,this.hcover,this.address,);

  factory Jr.fromJson(Map<String, dynamic> srcJson) => _$JrFromJson(srcJson);

  Map<String, dynamic> toJson() => _$JrToJson(this);

}


@JsonSerializable()
class Arr extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'currid')
  int currid;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'hcover')
  String hcover;

  @JsonKey(name: 'clicks')
  int clicks;

  Arr(this.id,this.currid,this.name,this.hcover,this.clicks,);

  factory Arr.fromJson(Map<String, dynamic> srcJson) => _$ArrFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArrToJson(this);

}


@JsonSerializable()
class Lb extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'currid')
  int currid;

  @JsonKey(name: 'img')
  String img;

  @JsonKey(name: 'pid')
  int pid;

  Lb(this.id,this.currid,this.img,this.pid,);

  factory Lb.fromJson(Map<String, dynamic> srcJson) => _$LbFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LbToJson(this);

}
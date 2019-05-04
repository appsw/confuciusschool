import 'package:json_annotation/json_annotation.dart';

part 'MyPointsInfo.g.dart';


@JsonSerializable()
class MyPointsInfo extends Object {

  @JsonKey(name: 're')
  String re;

  @JsonKey(name: 'sql')
  List<Sql> sql;

  MyPointsInfo(this.re,this.sql,);

  factory MyPointsInfo.fromJson(Map<String, dynamic> srcJson) => _$MyPointsInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MyPointsInfoToJson(this);

}


@JsonSerializable()
class Sql extends Object {

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'pointsum')
  int pointsum;

  @JsonKey(name: 'createTime')
  String createTime;

  Sql(this.type,this.pointsum,this.createTime,);

  factory Sql.fromJson(Map<String, dynamic> srcJson) => _$SqlFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SqlToJson(this);

}



import 'package:json_annotation/json_annotation.dart';

part 'ActivityInfo.g.dart';


@JsonSerializable()
class ActivityInfo extends Object {

  @JsonKey(name: 'sql')
  List<Sql> sql;

  ActivityInfo(this.sql,);

  factory ActivityInfo.fromJson(Map<String, dynamic> srcJson) => _$ActivityInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ActivityInfoToJson(this);

}


@JsonSerializable()
class Sql extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'img')
  String img;

  Sql(this.id,this.title,this.img,);

  factory Sql.fromJson(Map<String, dynamic> srcJson) => _$SqlFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SqlToJson(this);

}
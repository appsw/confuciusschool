import 'package:json_annotation/json_annotation.dart';

part 'ActivityDetailsInfo.g.dart';


@JsonSerializable()
class ActivityDetailsInfo extends Object {

  @JsonKey(name: 'sql')
  Sql sql;

  ActivityDetailsInfo(this.sql,);

  factory ActivityDetailsInfo.fromJson(Map<String, dynamic> srcJson) => _$ActivityDetailsInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ActivityDetailsInfoToJson(this);

}


@JsonSerializable()
class Sql extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'explain')
  String explain;

  @JsonKey(name: 'img')
  String img;

  @JsonKey(name: 'uedtext')
  String uedtext;

  Sql(this.title,this.explain,this.img,this.uedtext,);

  factory Sql.fromJson(Map<String, dynamic> srcJson) => _$SqlFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SqlToJson(this);

}
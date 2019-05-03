import 'package:json_annotation/json_annotation.dart';

part 'SignInShowInfo.g.dart';


@JsonSerializable()
class SignInShowInfo extends Object {

  @JsonKey(name: 'sql')
  Sql sql;

  @JsonKey(name: 'time')
  String time;

  @JsonKey(name: 'week')
  String week;

  SignInShowInfo(this.sql,this.time,this.week,);

  factory SignInShowInfo.fromJson(Map<String, dynamic> srcJson) => _$SignInShowInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SignInShowInfoToJson(this);

}


@JsonSerializable()
class Sql extends Object {

  @JsonKey(name: 'img')
  String img;

  @JsonKey(name: 'words')
  String words;

  @JsonKey(name: 'brand')
  String brand;

  @JsonKey(name: 'rimg')
  String rimg;

  Sql(this.img,this.words,this.brand,this.rimg,);

  factory Sql.fromJson(Map<String, dynamic> srcJson) => _$SqlFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SqlToJson(this);

}
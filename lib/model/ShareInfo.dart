import 'package:json_annotation/json_annotation.dart';

part 'ShareInfo.g.dart';


@JsonSerializable()
class ShareInfo extends Object {

  @JsonKey(name: 'invitecode')
  String invitecode;

  @JsonKey(name: 're')
  Re re;

  @JsonKey(name: 'nickName')
  String nickName;

  @JsonKey(name: 'profilePhoto')
  String profilePhoto;

  ShareInfo(this.invitecode,this.re,this.nickName,this.profilePhoto,);

  factory ShareInfo.fromJson(Map<String, dynamic> srcJson) => _$ShareInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ShareInfoToJson(this);

}


@JsonSerializable()
class Re extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'words')
  String words;

  @JsonKey(name: 'vcover')
  String vcover;

  @JsonKey(name: 'address')
  String address;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'currid')
  int currid;

  Re(this.id,this.words,this.vcover,this.address,this.name,this.currid,);

  factory Re.fromJson(Map<String, dynamic> srcJson) => _$ReFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ReToJson(this);

}
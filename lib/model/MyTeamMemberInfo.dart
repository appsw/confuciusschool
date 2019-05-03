import 'package:json_annotation/json_annotation.dart';

part 'MyTeamMemberInfo.g.dart';


@JsonSerializable()
class MyTeamMemberInfo extends Object {

  @JsonKey(name: 'res')
  List<Res> res;

  MyTeamMemberInfo(this.res,);

  factory MyTeamMemberInfo.fromJson(Map<String, dynamic> srcJson) => _$MyTeamMemberInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MyTeamMemberInfoToJson(this);

}


@JsonSerializable()
class Res extends Object {

  @JsonKey(name: 'nickName')
  String nickName;

  @JsonKey(name: 'profilePhoto')
  String profilePhoto;

  @JsonKey(name: 'account')
  String account;

  @JsonKey(name: 'createTime')
  String createTime;

  Res(this.nickName,this.profilePhoto,this.account,this.createTime,);

  factory Res.fromJson(Map<String, dynamic> srcJson) => _$ResFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResToJson(this);

}
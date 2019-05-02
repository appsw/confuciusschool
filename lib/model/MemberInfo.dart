import 'package:json_annotation/json_annotation.dart';

part 'MemberInfo.g.dart';


@JsonSerializable()
class MemberInfo extends Object {

  @JsonKey(name: 'list')
  Listinfo listinfo;

  MemberInfo(this.listinfo,);

  factory MemberInfo.fromJson(Map<String, dynamic> srcJson) => _$MemberInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MemberInfoToJson(this);

}


@JsonSerializable()
class Listinfo extends Object {

  @JsonKey(name: 'nickName')
  String nickName;

  @JsonKey(name: 'IsVip')
  int isVip;

  @JsonKey(name: 'profilePhoto')
  String profilePhoto;

  @JsonKey(name: 'invitecode')
  String invitecode;

  @JsonKey(name: 'balance')
  String balance;

  Listinfo(this.nickName,this.isVip,this.profilePhoto,this.invitecode,this.balance,);

  factory Listinfo.fromJson(Map<String, dynamic> srcJson) => _$ListinfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ListinfoToJson(this);

}
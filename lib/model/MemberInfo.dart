import 'package:json_annotation/json_annotation.dart';

part 'MemberInfo.g.dart';


@JsonSerializable()
class MemberInfo extends Object {

  @JsonKey(name: 'num')
  String num;

  @JsonKey(name: 'balance')
  String balance;

  @JsonKey(name: 'overTime')
  String overTime;

  @JsonKey(name: 'list')
  List1 list;

  MemberInfo(this.num,this.balance,this.overTime,this.list,);

  factory MemberInfo.fromJson(Map<String, dynamic> srcJson) => _$MemberInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MemberInfoToJson(this);

}


@JsonSerializable()
class List1 extends Object {

  @JsonKey(name: 'nickName')
  String nickName;

  @JsonKey(name: 'IsVip')
  int isVip;

  @JsonKey(name: 'profilePhoto')
  String profilePhoto;

  @JsonKey(name: 'invitecode')
  String invitecode;

  @JsonKey(name: 'integral')
  String integral;

  @JsonKey(name: 'isAgent')
  int isAgent;

  @JsonKey(name: 'sex')
  int sex;

  List1(this.nickName,this.isVip,this.profilePhoto,this.invitecode,this.integral,this.isAgent,this.sex,);

  factory List1.fromJson(Map<String, dynamic> srcJson) => _$List1FromJson(srcJson);

  Map<String, dynamic> toJson() => _$List1ToJson(this);

}

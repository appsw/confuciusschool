import 'package:json_annotation/json_annotation.dart';

part 'PersonalInfo.g.dart';


@JsonSerializable()
class PersonalInfo extends Object {

  @JsonKey(name: 'nickName')
  String nickName;

  @JsonKey(name: 'profilePhoto')
  String profilePhoto;

  @JsonKey(name: 'account')
  String account;

  @JsonKey(name: 'sex')
  int sex;

  @JsonKey(name: 'birth')
  String birth;

  @JsonKey(name: 'bname')
  String bname;

  @JsonKey(name: 'dname')
  String dname;

  @JsonKey(name: 'ename')
  String ename;

  @JsonKey(name: 'invitecode')
  String invitecode;

  PersonalInfo(this.nickName,this.profilePhoto,this.account,this.sex,this.birth,this.bname,this.dname,this.ename,this.invitecode,);

  factory PersonalInfo.fromJson(Map<String, dynamic> srcJson) => _$PersonalInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PersonalInfoToJson(this);

}



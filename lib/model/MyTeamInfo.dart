import 'package:json_annotation/json_annotation.dart';

part 'MyTeamInfo.g.dart';

@JsonSerializable()
class MyTeamInfo extends Object {

  @JsonKey(name: 'sum')
  int sum;

  @JsonKey(name: 'isused')
  int isused;

  @JsonKey(name: 'notused')
  int notused;

  MyTeamInfo(this.sum,this.isused,this.notused,);

  factory MyTeamInfo.fromJson(Map<String, dynamic> srcJson) => _$MyTeamInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MyTeamInfoToJson(this);

}
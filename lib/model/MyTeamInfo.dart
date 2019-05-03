import 'package:json_annotation/json_annotation.dart';

part 'MyTeamInfo.g.dart';


@JsonSerializable()
class MyTeamInfo extends Object {

  @JsonKey(name: 'data')
  Data data;

  MyTeamInfo(this.data,);

  factory MyTeamInfo.fromJson(Map<String, dynamic> srcJson) => _$MyTeamInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MyTeamInfoToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'arr3')
  String arr3;

  @JsonKey(name: 'arr4')
  int arr4;

  @JsonKey(name: 'arr5')
  int arr5;

  Data(this.arr3,this.arr4,this.arr5,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}
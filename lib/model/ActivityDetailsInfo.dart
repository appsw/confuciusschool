import 'package:json_annotation/json_annotation.dart';

part 'ActivityDetailsInfo.g.dart';



@JsonSerializable()
class ActivityDetailsInfo extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'explain')
  String explain;

  @JsonKey(name: 'img')
  String img;

  @JsonKey(name: 'uedtext')
  String uedtext;

  ActivityDetailsInfo(this.id,this.title,this.explain,this.img,this.uedtext,);

  factory ActivityDetailsInfo.fromJson(Map<String, dynamic> srcJson) => _$ActivityDetailsInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ActivityDetailsInfoToJson(this);

}
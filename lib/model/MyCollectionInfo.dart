import 'package:json_annotation/json_annotation.dart';

part 'MyCollectionInfo.g.dart';


@JsonSerializable()
class MyCollectionInfo extends Object {

  @JsonKey(name: 'arr')
  List<Arr> arr;

  MyCollectionInfo(this.arr,);

  factory MyCollectionInfo.fromJson(Map<String, dynamic> srcJson) => _$MyCollectionInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MyCollectionInfoToJson(this);

}


@JsonSerializable()
class Arr extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'photo')
  String photo;

  @JsonKey(name: 'zed')
  String zed;

  @JsonKey(name: 'iid')
  int iid;

  @JsonKey(name: 'mname')
  String mname;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'video')
  String video;

  @JsonKey(name: 'describe')
  String describe;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'time')
  String time;

  Arr(this.id,this.name,this.photo,this.zed,this.iid,this.mname,this.type,this.video,this.describe,this.createTime,this.updateTime,this.time,);

  factory Arr.fromJson(Map<String, dynamic> srcJson) => _$ArrFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArrToJson(this);

}



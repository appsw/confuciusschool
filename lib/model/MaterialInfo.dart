import 'package:json_annotation/json_annotation.dart';

part 'MaterialInfo.g.dart';

List<MaterialInfo> getMaterialInfoList(List<dynamic> list){
  List<MaterialInfo> result = [];
  list.forEach((item){
    result.add(MaterialInfo.fromJson(item));
  });
  return result;
}
@JsonSerializable()
class MaterialInfo extends Object {

  @JsonKey(name: 'iid')
  int iid;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'photo')
  String photo;

  @JsonKey(name: 'zed')
  String zed;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'mname')
  String mname;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'video')
  List<String> video;

  @JsonKey(name: 'describe')
  String describe;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'fnum')
  int fnum;

  @JsonKey(name: 'photos')
  String photos;

  @JsonKey(name: 'time')
  String time;

  @JsonKey(name: 'status')
  int status;

  MaterialInfo(this.iid,this.name,this.photo,this.zed,this.id,this.mname,this.type,this.video,this.describe,this.createTime,this.updateTime,this.fnum,this.photos,this.time,this.status,);

  factory MaterialInfo.fromJson(Map<String, dynamic> srcJson) => _$MaterialInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MaterialInfoToJson(this);

}
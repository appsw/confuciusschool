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

  @JsonKey(name: 'describe')
  String describe;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'fnum')
  int fnum;

  @JsonKey(name: 'time')
  String time;

  MaterialInfo(this.id,this.name,this.photo,this.zed,this.iid,this.mname,this.type,this.describe,this.updateTime,this.fnum,this.time,);

  factory MaterialInfo.fromJson(Map<String, dynamic> srcJson) => _$MaterialInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MaterialInfoToJson(this);

}



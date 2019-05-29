import 'package:json_annotation/json_annotation.dart';

part 'CourseInfo.g.dart';


List<CourseInfo> getCourseInfoList(List<dynamic> list){
  List<CourseInfo> result = [];
  list.forEach((item){
    result.add(CourseInfo.fromJson(item));
  });
  return result;
}
@JsonSerializable()
class CourseInfo extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'photo')
  String photo;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'zed')
  String zed;

  @JsonKey(name: 'words')
  String words;

  @JsonKey(name: 'pwords')
  String pwords;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'pid')
  String pid;

  @JsonKey(name: 'fnum')
  int fnum;

  @JsonKey(name: 'fcover')
  String fcover;

  @JsonKey(name: 'currid')
  int currid;

  @JsonKey(name: 'pname')
  String pname;

  @JsonKey(name: 'time')
  String time;

  @JsonKey(name: 'status')
  int status;

  CourseInfo(this.id,this.name,this.photo,this.createTime,this.zed,this.words,this.pwords,this.type,this.pid,this.fnum,this.fcover,this.currid,this.pname,this.time,this.status,);

  factory CourseInfo.fromJson(Map<String, dynamic> srcJson) => _$CourseInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CourseInfoToJson(this);

}






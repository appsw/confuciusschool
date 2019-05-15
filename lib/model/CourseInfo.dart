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

  @JsonKey(name: 'zed')
  String zed;

  @JsonKey(name: 'userid')
  int userid;

  @JsonKey(name: 'cname')
  String cname;

  @JsonKey(name: 'words')
  String words;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'pid')
  int pid;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'fnum')
  int fnum;

  @JsonKey(name: 'img')
  String img;

  @JsonKey(name: 'time')
  String time;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'currid')
  int currid;

  CourseInfo(this.id,this.name,this.photo,this.zed,this.userid,this.cname,this.words,this.type,this.pid,this.createTime,this.updateTime,this.fnum,this.img,this.time,this.status,this.currid,);

  factory CourseInfo.fromJson(Map<String, dynamic> srcJson) => _$CourseInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CourseInfoToJson(this);

}






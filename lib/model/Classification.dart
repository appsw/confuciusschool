import 'package:json_annotation/json_annotation.dart';

part 'Classification.g.dart';


List<Classification> getClassificationList(List<dynamic> list){
  List<Classification> result = [];
  list.forEach((item){
    result.add(Classification.fromJson(item));
  });
  return result;
}
@JsonSerializable()
class Classification extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'currid')
  int currid;

  @JsonKey(name: 'fcover')
  String fcover;

  @JsonKey(name: 'clicks')
  int clicks;

  @JsonKey(name: 'level')
  int level;

  @JsonKey(name: 'cuname')
  String lecturer;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'words')
  String words;

  Classification(this.id,this.name,this.currid,this.fcover,this.clicks,this.level,this.lecturer,this.createTime,this.words,);

  factory Classification.fromJson(Map<String, dynamic> srcJson) => _$ClassificationFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ClassificationToJson(this);

}
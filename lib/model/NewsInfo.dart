import 'package:json_annotation/json_annotation.dart';

part 'NewsInfo.g.dart';


List<NewsInfo> getNewsInfoList(List<dynamic> list){
  List<NewsInfo> result = [];
  list.forEach((item){
    result.add(NewsInfo.fromJson(item));
  });
  return result;
}
@JsonSerializable()
class NewsInfo extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'ititle')
  String ititle;

  @JsonKey(name: 'about')
  String about;

  @JsonKey(name: 'currid')
  int currid;

  NewsInfo(this.id,this.type,this.ititle,this.about,this.currid,);

  factory NewsInfo.fromJson(Map<String, dynamic> srcJson) => _$NewsInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewsInfoToJson(this);

}



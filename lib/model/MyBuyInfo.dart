import 'package:json_annotation/json_annotation.dart';

part 'MyBuyInfo.g.dart';


List<MyBuyInfo> getMyBuyInfoList(List<dynamic> list){
  List<MyBuyInfo> result = [];
  list.forEach((item){
    result.add(MyBuyInfo.fromJson(item));
  });
  return result;
}
@JsonSerializable()
class MyBuyInfo extends Object {

  @JsonKey(name: 'brief')
  String brief;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'num')
  int num;

  MyBuyInfo(this.brief,this.name,this.num,);

  factory MyBuyInfo.fromJson(Map<String, dynamic> srcJson) => _$MyBuyInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MyBuyInfoToJson(this);

}
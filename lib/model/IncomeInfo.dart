import 'package:json_annotation/json_annotation.dart';

part 'IncomeInfo.g.dart';


List<IncomeInfo> getIncomeInfoList(List<dynamic> list){
  List<IncomeInfo> result = [];
  list.forEach((item){
    result.add(IncomeInfo.fromJson(item));
  });
  return result;
}
@JsonSerializable()
class IncomeInfo extends Object {

  @JsonKey(name: 'total')
  String total;

  @JsonKey(name: 'after')
  String after;

  @JsonKey(name: 'createTime')
  String createTime;

  IncomeInfo(this.total,this.after,this.createTime,);

  factory IncomeInfo.fromJson(Map<String, dynamic> srcJson) => _$IncomeInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IncomeInfoToJson(this);

}



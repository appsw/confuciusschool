import 'package:json_annotation/json_annotation.dart';

part 'IntroductionInfo.g.dart';


@JsonSerializable()
class IntroductionInfo extends Object {

  @JsonKey(name: 'brief')
  List<String> brief;

  IntroductionInfo(this.brief,);

  factory IntroductionInfo.fromJson(Map<String, dynamic> srcJson) => _$IntroductionInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IntroductionInfoToJson(this);

}



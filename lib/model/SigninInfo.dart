import 'package:json_annotation/json_annotation.dart';

part 'SigninInfo.g.dart';


@JsonSerializable()
class SigninInfo extends Object {

  @JsonKey(name: 'one')
  String one;

  @JsonKey(name: 'two')
  String two;

  @JsonKey(name: 'three')
  String three;

  @JsonKey(name: 'four')
  String four;

  @JsonKey(name: 'five')
  String five;

  @JsonKey(name: 'six')
  String six;

  @JsonKey(name: 'seven')
  String seven;

  @JsonKey(name: 'weekday')
  int weekday;

  @JsonKey(name: 'isday')
  int isday;


  @JsonKey(name: 'sign')
  String sign;

  @JsonKey(name: 'rule')
  Rule rule;

  SigninInfo(this.one,this.two,this.three,this.four,this.five,this.six,this.seven,this.weekday,this.isday,this.sign,this.rule,);

  factory SigninInfo.fromJson(Map<String, dynamic> srcJson) => _$SigninInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SigninInfoToJson(this);

}


@JsonSerializable()
class Rule extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'explain')
  String explain;

  Rule(this.title,this.explain,);

  factory Rule.fromJson(Map<String, dynamic> srcJson) => _$RuleFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RuleToJson(this);

}
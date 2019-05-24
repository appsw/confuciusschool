// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SigninInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninInfo _$SigninInfoFromJson(Map<String, dynamic> json) {
  return SigninInfo(
      json['one'] as String,
      json['two'] as String,
      json['three'] as String,
      json['four'] as String,
      json['five'] as String,
      json['six'] as String,
      json['seven'] as String,
      json['weekday'] as int,
      json['isday'] as int,
      json['sign'] as String,
      json['rule'] == null
          ? null
          : Rule.fromJson(json['rule'] as Map<String, dynamic>));
}

Map<String, dynamic> _$SigninInfoToJson(SigninInfo instance) =>
    <String, dynamic>{
      'one': instance.one,
      'two': instance.two,
      'three': instance.three,
      'four': instance.four,
      'five': instance.five,
      'six': instance.six,
      'seven': instance.seven,
      'weekday': instance.weekday,
      'isday': instance.isday,
      'sign': instance.sign,
      'rule': instance.rule
    };

Rule _$RuleFromJson(Map<String, dynamic> json) {
  return Rule(json['title'] as String, json['explain'] as String);
}

Map<String, dynamic> _$RuleToJson(Rule instance) =>
    <String, dynamic>{'title': instance.title, 'explain': instance.explain};

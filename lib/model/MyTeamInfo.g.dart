// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyTeamInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyTeamInfo _$MyTeamInfoFromJson(Map<String, dynamic> json) {
  return MyTeamInfo(json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$MyTeamInfoToJson(MyTeamInfo instance) =>
    <String, dynamic>{'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(json['arr3'] as String, json['arr4'] as int, json['arr5'] as int);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'arr3': instance.arr3,
      'arr4': instance.arr4,
      'arr5': instance.arr5
    };

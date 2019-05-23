// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShopInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopInfo _$ShopInfoFromJson(Map<String, dynamic> json) {
  return ShopInfo(
      (json['res'] as List)
          ?.map(
              (e) => e == null ? null : Res.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['ress'] as List)
          ?.map((e) =>
              e == null ? null : Ress.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ShopInfoToJson(ShopInfo instance) =>
    <String, dynamic>{'res': instance.res, 'ress': instance.ress};

Res _$ResFromJson(Map<String, dynamic> json) {
  return Res(json['img'] as String, json['id'] as int, json['currid'] as int,
      json['pid'] as int, json['ctype'] as int);
}

Map<String, dynamic> _$ResToJson(Res instance) => <String, dynamic>{
      'img': instance.img,
      'id': instance.id,
      'currid': instance.currid,
      'pid': instance.pid,
      'ctype': instance.ctype
    };

Ress _$RessFromJson(Map<String, dynamic> json) {
  return Ress(
      json['id'] as int,
      json['name'] as String,
      json['icon'] as String,
      json['master'] as String,
      json['brief'] as String,
      json['introduce'] as String,
      json['money'] as int,
      json['integral'] as int,
      json['num'] as int,
      json['type'] as int);
}

Map<String, dynamic> _$RessToJson(Ress instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'master': instance.master,
      'brief': instance.brief,
      'introduce': instance.introduce,
      'money': instance.money,
      'integral': instance.integral,
      'num': instance.num,
      'type': instance.type
    };

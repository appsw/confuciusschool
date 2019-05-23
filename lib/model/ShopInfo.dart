import 'package:json_annotation/json_annotation.dart';

part 'ShopInfo.g.dart';


@JsonSerializable()
class ShopInfo extends Object {

  @JsonKey(name: 'res')
  List<Res> res;

  @JsonKey(name: 'ress')
  List<Ress> ress;

  ShopInfo(this.res,this.ress,);

  factory ShopInfo.fromJson(Map<String, dynamic> srcJson) => _$ShopInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ShopInfoToJson(this);

}


@JsonSerializable()
class Res extends Object {

  @JsonKey(name: 'img')
  String img;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'currid')
  int currid;

  @JsonKey(name: 'pid')
  int pid;

  @JsonKey(name: 'ctype')
  int ctype;

  Res(this.img,this.id,this.currid,this.pid,this.ctype,);

  factory Res.fromJson(Map<String, dynamic> srcJson) => _$ResFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResToJson(this);

}


@JsonSerializable()
class Ress extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'master')
  String master;

  @JsonKey(name: 'brief')
  String brief;

  @JsonKey(name: 'introduce')
  String introduce;

  @JsonKey(name: 'money')
  int money;

  @JsonKey(name: 'integral')
  int integral;

  @JsonKey(name: 'num')
  int num;

  @JsonKey(name: 'type')
  int type;

  Ress(this.id,this.name,this.icon,this.master,this.brief,this.introduce,this.money,this.integral,this.num,this.type,);

  factory Ress.fromJson(Map<String, dynamic> srcJson) => _$RessFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RessToJson(this);

}
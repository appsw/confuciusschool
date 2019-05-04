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

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'img')
  String img;

  @JsonKey(name: 'status')
  int status;

  Res(this.id,this.title,this.url,this.img,this.status,);

  factory Res.fromJson(Map<String, dynamic> srcJson) => _$ResFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResToJson(this);

}


@JsonSerializable()
class Ress extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'lcon')
  String lcon;

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

  @JsonKey(name: 'lev')
  int lev;

  @JsonKey(name: 'num')
  int num;

  @JsonKey(name: 'type')
  int type;

  Ress(this.id,this.name,this.lcon,this.master,this.brief,this.introduce,this.money,this.integral,this.lev,this.num,this.type,);

  factory Ress.fromJson(Map<String, dynamic> srcJson) => _$RessFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RessToJson(this);

}
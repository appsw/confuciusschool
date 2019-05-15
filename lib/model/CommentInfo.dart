import 'package:json_annotation/json_annotation.dart';

part 'CommentInfo.g.dart';


List<CommentInfo> getCommentInfoList(List<dynamic> list){
  List<CommentInfo> result = [];
  list.forEach((item){
    result.add(CommentInfo.fromJson(item));
  });
  return result;
}
@JsonSerializable()
class CommentInfo extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'nickName')
  String nickName;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'profilePhoto')
  String profilePhoto;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'zan_count')
  int zanCount;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'replay')
  List<Replay> replay;

  CommentInfo(this.id,this.nickName,this.status,this.profilePhoto,this.content,this.zanCount,this.createTime,this.type,this.replay,);

  factory CommentInfo.fromJson(Map<String, dynamic> srcJson) => _$CommentInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CommentInfoToJson(this);

}


@JsonSerializable()
class Replay extends Object {

  @JsonKey(name: 'nickName')
  String nickName;

  @JsonKey(name: 'profilePhoto')
  String profilePhoto;

  @JsonKey(name: 'content')
  String content;

  Replay(this.nickName,this.profilePhoto,this.content,);

  factory Replay.fromJson(Map<String, dynamic> srcJson) => _$ReplayFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ReplayToJson(this);

}



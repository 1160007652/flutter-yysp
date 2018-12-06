import 'package:json_annotation/json_annotation.dart'; 
  
part 'video_detail.g.dart';


@JsonSerializable()
  class VideoDetail extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  Data data;

  VideoDetail(this.code,this.data,);

  factory VideoDetail.fromJson(Map<String, dynamic> srcJson) => _$VideoDetailFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideoDetailToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

  @JsonKey(name: 'video')
  Video video;

  Data(this.video,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
@JsonSerializable()
  class Video extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'auther')
  String auther;

  @JsonKey(name: 'pubtime')
  String pubtime;

  @JsonKey(name: 'img')
  String img;

  @JsonKey(name: 'src')
  String src;

  @JsonKey(name: 'desc1')
  String desc1;

  @JsonKey(name: 'cate')
  String cate;

  @JsonKey(name: 'pt')
  String pt;

  @JsonKey(name: 'collect')
  int collect;

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'insertTime')
  String insertTime;
  Video(this.id,this.title,this.url,this.auther,this.pubtime,this.img,this.src,this.desc1,this.cate,this.pt,this.collect,this.count,this.insertTime,);

  factory Video.fromJson(Map<String, dynamic> srcJson) => _$VideoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideoToJson(this);

}
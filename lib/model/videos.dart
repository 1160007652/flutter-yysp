import 'package:json_annotation/json_annotation.dart'; 
  
part 'videos.g.dart';


@JsonSerializable()
  class Videos extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  Data data;

  Videos(this.code,this.data,);

  factory Videos.fromJson(Map<String, dynamic> srcJson) => _$VideosFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideosToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

  @JsonKey(name: 'list')
  List <dynamic> listData;

  Data(this.listData,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
@JsonSerializable()
  class ListData extends Object {

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

  ListData(this.id,this.title,this.url,this.auther,this.pubtime,this.img,this.src,this.desc1,this.cate,this.pt,this.collect,this.count,this.insertTime,);

  factory ListData.fromJson(Map<String, dynamic> srcJson) => _$ListDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ListDataToJson(this);

}

  

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Videos _$VideosFromJson(Map<String, dynamic> json) {
  return Videos(
      json['code'] as int,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$VideosToJson(Videos instance) =>
    <String, dynamic>{'code': instance.code, 'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(json['list'] as List);
}

Map<String, dynamic> _$DataToJson(Data instance) =>
    <String, dynamic>{'list': instance.listData};

ListData _$ListDataFromJson(Map<String, dynamic> json) {
  return ListData(
      json['id'] as int,
      json['title'] as String,
      json['url'] as String,
      json['auther'] as String,
      json['pubtime'] as String,
      json['img'] as String,
      json['src'] as String,
      json['desc1'] as String,
      json['cate'] as String,
      json['pt'] as String,
      json['collect'] as int,
      json['count'] as int,
      json['insertTime'] as String);
}

Map<String, dynamic> _$ListDataToJson(ListData instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'auther': instance.auther,
      'pubtime': instance.pubtime,
      'img': instance.img,
      'src': instance.src,
      'desc1': instance.desc1,
      'cate': instance.cate,
      'pt': instance.pt,
      'collect': instance.collect,
      'count': instance.count,
      'insertTime': instance.insertTime
    };

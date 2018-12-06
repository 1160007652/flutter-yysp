// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoDetail _$VideoDetailFromJson(Map<String, dynamic> json) {
  return VideoDetail(
      json['code'] as int,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$VideoDetailToJson(VideoDetail instance) =>
    <String, dynamic>{'code': instance.code, 'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(json['video'] == null
      ? null
      : Video.fromJson(json['video'] as Map<String, dynamic>));
}

Map<String, dynamic> _$DataToJson(Data instance) =>
    <String, dynamic>{'video': instance.video};

Video _$VideoFromJson(Map<String, dynamic> json) {
  return Video(
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

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
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

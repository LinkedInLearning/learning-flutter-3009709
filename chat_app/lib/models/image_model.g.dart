// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixelfordImage _$PixelformImageFromJson(Map<String, dynamic> json) =>
    PixelfordImage(
      title: json['title'] as String?,
      filename: json['filename'] as String,
      urlSmallSize: json['url_small_size'] as String,
      id: json['id'] as String,
      urlFullSize: json['url_full_size'] as String,
    );

Map<String, dynamic> _$PixelformImageToJson(PixelfordImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'title': instance.title,
      'url_full_size': instance.urlFullSize,
      'url_small_size': instance.urlSmallSize,
    };

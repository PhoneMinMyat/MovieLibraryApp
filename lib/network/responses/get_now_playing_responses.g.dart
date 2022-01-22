// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_now_playing_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNowPlayingResponses _$GetNowPlayingResponsesFromJson(
        Map<String, dynamic> json) =>
    GetNowPlayingResponses(
      dates: json['dates'] == null
          ? null
          : DateVO.fromJson(json['dates'] as Map<String, dynamic>),
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetNowPlayingResponsesToJson(
        GetNowPlayingResponses instance) =>
    <String, dynamic>{
      'dates': instance.dates,
      'page': instance.page,
      'results': instance.results,
    };

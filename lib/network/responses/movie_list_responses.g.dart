// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListResponses _$MovieListResponsesFromJson(Map<String, dynamic> json) =>
    MovieListResponses(
      dates: json['dates'] == null
          ? null
          : DateVO.fromJson(json['dates'] as Map<String, dynamic>),
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieListResponsesToJson(MovieListResponses instance) =>
    <String, dynamic>{
      'dates': instance.dates,
      'page': instance.page,
      'results': instance.results,
    };

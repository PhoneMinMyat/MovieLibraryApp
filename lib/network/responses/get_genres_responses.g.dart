// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_genres_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGenresResponses _$GetGenresResponsesFromJson(Map<String, dynamic> json) =>
    GetGenresResponses(
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetGenresResponsesToJson(GetGenresResponses instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };

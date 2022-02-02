// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_credit_by_movie_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCreditByMovieResponses _$GetCreditByMovieResponsesFromJson(
        Map<String, dynamic> json) =>
    GetCreditByMovieResponses(
      id: json['id'] as int?,
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => ActorVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>?)
          ?.map((e) => ActorVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCreditByMovieResponsesToJson(
        GetCreditByMovieResponses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };

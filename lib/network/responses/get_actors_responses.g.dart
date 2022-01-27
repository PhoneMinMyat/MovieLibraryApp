// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_actors_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetActorsResponses _$GetActorsResponsesFromJson(Map<String, dynamic> json) =>
    GetActorsResponses(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ActorVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetActorsResponsesToJson(GetActorsResponses instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

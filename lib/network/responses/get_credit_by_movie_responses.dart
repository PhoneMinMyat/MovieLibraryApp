import 'package:json_annotation/json_annotation.dart';

import 'package:movie_app/data/vos/actor_vo.dart';

part 'get_credit_by_movie_responses.g.dart';

@JsonSerializable()
class GetCreditByMovieResponses {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'cast')
  List<ActorVO>? cast;

  @JsonKey(name: 'crew')
  List<ActorVO>? crew;
  GetCreditByMovieResponses({
    this.id,
    this.cast,
    this.crew,
  });

  factory GetCreditByMovieResponses.fromJson(Map<String, dynamic> json) =>
      _$GetCreditByMovieResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$GetCreditByMovieResponsesToJson(this);
}

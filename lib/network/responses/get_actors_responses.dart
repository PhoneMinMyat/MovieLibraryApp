import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/actor_vo.dart';

part 'get_actors_responses.g.dart';

@JsonSerializable()
class GetActorsResponses {


  @JsonKey(name: 'results')
  List<ActorVO>? results;


  GetActorsResponses({
    this.results,
  });

  factory GetActorsResponses.fromJson(Map<String, dynamic> json) => _$GetActorsResponsesFromJson(json);

   Map<String, dynamic> toJson() => _$GetActorsResponsesToJson(this);
}

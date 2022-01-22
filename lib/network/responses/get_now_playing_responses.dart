import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/date_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

part 'get_now_playing_responses.g.dart';

@JsonSerializable()
class GetNowPlayingResponses {
  @JsonKey(name: 'dates')
  DateVO? dates;
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<MovieVO>? results;


  GetNowPlayingResponses({
    this.dates,
    this.page,
    this.results,
  });

factory GetNowPlayingResponses.fromJson(Map<String, dynamic> json) => _$GetNowPlayingResponsesFromJson(json);

   Map<String, dynamic> toJson() => _$GetNowPlayingResponsesToJson(this);

}

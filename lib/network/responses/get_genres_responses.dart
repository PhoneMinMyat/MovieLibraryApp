import 'package:json_annotation/json_annotation.dart';

import 'package:movie_app/data/vos/genre_vo.dart';

part 'get_genres_responses.g.dart';

@JsonSerializable()
class GetGenresResponses {
  @JsonKey(name: 'genres')
  List<GenreVO>? genres;
  GetGenresResponses({
    this.genres,
  });

  factory GetGenresResponses.fromJson(Map<String, dynamic> json) =>
      _$GetGenresResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$GetGenresResponsesToJson(this);
}

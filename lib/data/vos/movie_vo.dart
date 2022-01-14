import 'package:json_annotation/json_annotation.dart';

part 'movie_vo.g.dart';

@JsonSerializable()
class MovieVO {
  @JsonKey(name: "adult")
  bool? adult;

  @JsonKey(name: "backdrop_path")
  String? backdropPath;

  @JsonKey(name: "genre_ids")
  List? genreIds;

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "original_language")
  String? originalLanguage;

  @JsonKey(name: "original_title")
  String? originalTitle;

  @JsonKey(name: "overview")
  String? overview;

  @JsonKey(name: "popularity")
  double? popularity;

  @JsonKey(name: "poster_path")
  String? posterPath;

  @JsonKey(name: "release_date")
  String? releaseDate;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "video")
  bool? video;

  @JsonKey(name: "vote_average")
  double? voteAverage;

  @JsonKey(name: "vote_count")
  int? voteCount;

  
  MovieVO({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

   factory MovieVO.fromJson(Map<String, dynamic> json) => _$MovieVOFromJson(json);

   Map<String, dynamic> toJson() => _$MovieVOToJson(this);
}

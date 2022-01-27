import 'package:json_annotation/json_annotation.dart';

import 'package:movie_app/data/vos/collection_vo.dart';
import 'package:movie_app/data/vos/country_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/production_company_vo.dart';
import 'package:movie_app/data/vos/spoken_language_vo.dart';

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

  @JsonKey(name: 'belongs_to_collection')
  CollectionVO? belongsToCollection;

  @JsonKey(name: 'budget')
  double? budget;

  @JsonKey(name: 'genres')
  List<GenreVO>? genres;

  @JsonKey(name: 'homepage')
  String? homepage;

  @JsonKey(name: 'imdb_id')
  String? imdbId;

  @JsonKey(name: 'production_companies')
  List<ProductionCompanyVO>? productionCompanies;

  @JsonKey(name: 'production_countries')
  List<CountryVO>? productionCountries;

  @JsonKey(name: 'revenue')
  double? revenue;

  @JsonKey(name: 'runtime')
  int? runtime;

  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguageVO>? spokenLanguage;

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'tagline')
  String? tagLine;
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
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.imdbId,
    this.productionCompanies,
    this.productionCountries,
    this.revenue,
    this.runtime,
    this.spokenLanguage,
    this.status,
    this.tagLine,
  });


  factory MovieVO.fromJson(Map<String, dynamic> json) =>
      _$MovieVOFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVOToJson(this);


  @override
  String toString() {
    return 'MovieVO(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount, belongsToCollection: $belongsToCollection, budget: $budget, genres: $genres, homepage: $homepage, imdbId: $imdbId, productionCompanies: $productionCompanies, productionCountries: $productionCountries, revenue: $revenue, runtime: $runtime, spokenLanguage: $spokenLanguage, status: $status, tagLine: $tagLine)';
  }
}

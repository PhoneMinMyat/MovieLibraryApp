// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieVOAdapter extends TypeAdapter<MovieVO> {
  @override
  final int typeId = 6;

  @override
  MovieVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieVO(
      adult: fields[0] as bool?,
      backdropPath: fields[1] as String?,
      genreIds: (fields[2] as List?)?.cast<dynamic>(),
      id: fields[3] as int?,
      originalLanguage: fields[4] as String?,
      originalTitle: fields[5] as String?,
      overview: fields[6] as String?,
      popularity: fields[7] as double?,
      posterPath: fields[8] as String?,
      releaseDate: fields[9] as String?,
      title: fields[10] as String?,
      video: fields[11] as bool?,
      voteAverage: fields[12] as double?,
      voteCount: fields[13] as int?,
      belongsToCollection: fields[14] as CollectionVO?,
      budget: fields[15] as double?,
      genres: (fields[16] as List?)?.cast<GenreVO>(),
      homepage: fields[17] as String?,
      imdbId: fields[18] as String?,
      productionCompanies: (fields[19] as List?)?.cast<ProductionCompanyVO>(),
      productionCountries: (fields[20] as List?)?.cast<CountryVO>(),
      revenue: fields[21] as double?,
      runtime: fields[22] as int?,
      spokenLanguage: (fields[23] as List?)?.cast<SpokenLanguageVO>(),
      status: fields[24] as String?,
      tagLine: fields[25] as String?,
      isNowPlaying: fields[26] as bool?,
      isPopular: fields[27] as bool?,
      isTopRated: fields[28] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieVO obj) {
    writer
      ..writeByte(29)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.genreIds)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.originalLanguage)
      ..writeByte(5)
      ..write(obj.originalTitle)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.popularity)
      ..writeByte(8)
      ..write(obj.posterPath)
      ..writeByte(9)
      ..write(obj.releaseDate)
      ..writeByte(10)
      ..write(obj.title)
      ..writeByte(11)
      ..write(obj.video)
      ..writeByte(12)
      ..write(obj.voteAverage)
      ..writeByte(13)
      ..write(obj.voteCount)
      ..writeByte(14)
      ..write(obj.belongsToCollection)
      ..writeByte(15)
      ..write(obj.budget)
      ..writeByte(16)
      ..write(obj.genres)
      ..writeByte(17)
      ..write(obj.homepage)
      ..writeByte(18)
      ..write(obj.imdbId)
      ..writeByte(19)
      ..write(obj.productionCompanies)
      ..writeByte(20)
      ..write(obj.productionCountries)
      ..writeByte(21)
      ..write(obj.revenue)
      ..writeByte(22)
      ..write(obj.runtime)
      ..writeByte(23)
      ..write(obj.spokenLanguage)
      ..writeByte(24)
      ..write(obj.status)
      ..writeByte(25)
      ..write(obj.tagLine)
      ..writeByte(26)
      ..write(obj.isNowPlaying)
      ..writeByte(27)
      ..write(obj.isPopular)
      ..writeByte(28)
      ..write(obj.isTopRated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVO _$MovieVOFromJson(Map<String, dynamic> json) => MovieVO(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds: json['genre_ids'] as List<dynamic>?,
      id: json['id'] as int?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      belongsToCollection: json['belongs_to_collection'] == null
          ? null
          : CollectionVO.fromJson(
              json['belongs_to_collection'] as Map<String, dynamic>),
      budget: (json['budget'] as num?)?.toDouble(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String?,
      imdbId: json['imdb_id'] as String?,
      productionCompanies: (json['production_companies'] as List<dynamic>?)
          ?.map((e) => ProductionCompanyVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>?)
          ?.map((e) => CountryVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      revenue: (json['revenue'] as num?)?.toDouble(),
      runtime: json['runtime'] as int?,
      spokenLanguage: (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => SpokenLanguageVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      tagLine: json['tagline'] as String?,
      isNowPlaying: json['isNowPlaying'] as bool?,
      isPopular: json['isPopular'] as bool?,
      isTopRated: json['isTopRated'] as bool?,
    );

Map<String, dynamic> _$MovieVOToJson(MovieVO instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'belongs_to_collection': instance.belongsToCollection,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'imdb_id': instance.imdbId,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages': instance.spokenLanguage,
      'status': instance.status,
      'tagline': instance.tagLine,
      'isNowPlaying': instance.isNowPlaying,
      'isPopular': instance.isPopular,
      'isTopRated': instance.isTopRated,
    };

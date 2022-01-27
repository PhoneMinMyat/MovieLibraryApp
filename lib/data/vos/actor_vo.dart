import 'package:json_annotation/json_annotation.dart';

import 'package:movie_app/data/vos/movie_vo.dart';

part 'actor_vo.g.dart';

@JsonSerializable()
class ActorVO {
  @JsonKey(name: 'adult')
  bool? adult;

  @JsonKey(name: 'gender')
  int? gender;

  @JsonKey(name: 'id')
  int? id;


  @JsonKey(name: 'known_for')
  List<MovieVO>? knownFor;

  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'popularity')
  double? popularity;

  @JsonKey(name: 'profile_path')
  String? profilePath;
  ActorVO({
    this.adult,
    this.gender,
    this.id,
    this.knownFor,
    this.knownForDepartment,
    this.name,
    this.popularity,
    this.profilePath,
  });

  

  factory ActorVO.fromJson(Map<String, dynamic> json) => _$ActorVOFromJson(json);

   Map<String, dynamic> toJson() => _$ActorVOToJson(this);

  @override
  String toString() {
    return 'ActorVO(adult: $adult, gender: $gender, id: $id, knownFor: $knownFor)';
  }
}

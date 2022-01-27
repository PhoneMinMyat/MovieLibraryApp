import 'package:json_annotation/json_annotation.dart';

part 'genre_vo.g.dart';

@JsonSerializable()
class GenreVO {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;
  GenreVO({
    this.id,
    this.name,
  });

  factory GenreVO.fromJson(Map<String, dynamic> json) => _$GenreVOFromJson(json);

   Map<String, dynamic> toJson() => _$GenreVOToJson(this);

  @override
  String toString() => 'GenreVO(id: $id, name: $name)';
}

import 'package:json_annotation/json_annotation.dart';

part 'country_vo.g.dart';
@JsonSerializable()
class CountryVO {
  @JsonKey(name: 'iso_3166_1')
  String? iso3166;

  @JsonKey(name: 'name')
  String? name;

  CountryVO({
    this.iso3166,
    this.name,
  });

  factory CountryVO.fromJson(Map<String, dynamic> json) =>
      _$CountryVOFromJson(json);

  Map<String, dynamic> toJson() => _$CountryVOToJson(this);
}

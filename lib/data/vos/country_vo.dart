import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/persistence/hive_constants.dart';

part 'country_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_COUNTRY_VO,adapterName: 'CountryVOAdapter')
class CountryVO {
  @JsonKey(name: 'iso_3166_1')
   @HiveField(0)
  String? iso3166;

  @JsonKey(name: 'name')
   @HiveField(1)
  String? name;

  CountryVO({
    this.iso3166,
    this.name,
  });

  factory CountryVO.fromJson(Map<String, dynamic> json) =>
      _$CountryVOFromJson(json);

  Map<String, dynamic> toJson() => _$CountryVOToJson(this);
}

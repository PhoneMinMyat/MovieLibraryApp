// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryVO _$CountryVOFromJson(Map<String, dynamic> json) => CountryVO(
      iso3166: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CountryVOToJson(CountryVO instance) => <String, dynamic>{
      'iso_3166_1': instance.iso3166,
      'name': instance.name,
    };

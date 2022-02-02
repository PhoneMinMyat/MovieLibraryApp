// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryVOAdapter extends TypeAdapter<CountryVO> {
  @override
  final int typeId = 3;

  @override
  CountryVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountryVO(
      iso3166: fields[0] as String?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CountryVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.iso3166)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationItemModel _$LocationItemModelFromJson(Map<String, dynamic> json) =>
    _LocationItemModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['value'] as String?,
    );

Map<String, dynamic> _$LocationItemModelToJson(_LocationItemModel instance) =>
    <String, dynamic>{'id': instance.id, 'value': instance.name};

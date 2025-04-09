import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:location_picker_app/feature/country_state_picker/domain/entities/location_item.dart';

part 'location_item_model.freezed.dart';

part 'location_item_model.g.dart';

@freezed
abstract class LocationItemModel with _$LocationItemModel {
  const LocationItemModel._();

  const factory LocationItemModel({required int id, required String name}) =
      _LocationItemModel;

  factory LocationItemModel.fromJson(Map<String, dynamic> json) =>
      _$LocationItemModelFromJson(json);
}

extension LocationItemMapper on LocationItemModel {
  LocationItem toEntity() => LocationItem(id: id, name: name);
}

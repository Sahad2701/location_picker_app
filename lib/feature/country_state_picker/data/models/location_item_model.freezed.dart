// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationItemModel {

 int get id; String get name;
/// Create a copy of LocationItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationItemModelCopyWith<LocationItemModel> get copyWith => _$LocationItemModelCopyWithImpl<LocationItemModel>(this as LocationItemModel, _$identity);

  /// Serializes this LocationItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'LocationItemModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $LocationItemModelCopyWith<$Res>  {
  factory $LocationItemModelCopyWith(LocationItemModel value, $Res Function(LocationItemModel) _then) = _$LocationItemModelCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$LocationItemModelCopyWithImpl<$Res>
    implements $LocationItemModelCopyWith<$Res> {
  _$LocationItemModelCopyWithImpl(this._self, this._then);

  final LocationItemModel _self;
  final $Res Function(LocationItemModel) _then;

/// Create a copy of LocationItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LocationItemModel extends LocationItemModel {
  const _LocationItemModel({required this.id, required this.name}): super._();
  factory _LocationItemModel.fromJson(Map<String, dynamic> json) => _$LocationItemModelFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of LocationItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationItemModelCopyWith<_LocationItemModel> get copyWith => __$LocationItemModelCopyWithImpl<_LocationItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'LocationItemModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$LocationItemModelCopyWith<$Res> implements $LocationItemModelCopyWith<$Res> {
  factory _$LocationItemModelCopyWith(_LocationItemModel value, $Res Function(_LocationItemModel) _then) = __$LocationItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$LocationItemModelCopyWithImpl<$Res>
    implements _$LocationItemModelCopyWith<$Res> {
  __$LocationItemModelCopyWithImpl(this._self, this._then);

  final _LocationItemModel _self;
  final $Res Function(_LocationItemModel) _then;

/// Create a copy of LocationItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_LocationItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

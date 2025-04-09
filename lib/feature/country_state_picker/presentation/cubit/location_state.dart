import 'package:equatable/equatable.dart';
import 'package:location_picker_app/feature/country_state_picker/domain/entities/location_item.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class CountriesLoaded extends LocationState {
  final List<LocationItem> countries;

  const CountriesLoaded(this.countries);

  @override
  List<Object?> get props => [countries];
}

final class StatesLoaded extends LocationState {
  final List<LocationItem> states;

  const StatesLoaded(this.states);

  @override
  List<Object?> get props => [states];
}

final class LocationError extends LocationState {
  final String message;

  const LocationError(this.message);

  @override
  List<Object?> get props => [message];
}

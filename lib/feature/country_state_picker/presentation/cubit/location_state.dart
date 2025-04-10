import 'package:equatable/equatable.dart';
import 'package:location_picker_app/feature/country_state_picker/domain/entities/location_item.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class CountriesLoaded extends LocationState with EquatableMixin {
  final List<LocationItem> countries;

  CountriesLoaded(this.countries);

  @override
  List<Object?> get props => [countries];
}

class StatesLoaded extends LocationState with EquatableMixin {
  final List<LocationItem> states;
  final List<LocationItem> countries;
  final LocationItem? selectedState;

  StatesLoaded(this.states, this.countries, {this.selectedState});

  @override
  List<Object?> get props => [states, countries, selectedState]; // Include selectedState
}

class LocationError extends LocationState with EquatableMixin {
  final String message;

  LocationError(this.message);

  @override
  List<Object?> get props => [message];
}

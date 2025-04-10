import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_picker_app/core/constants/app_const.dart';
import 'package:location_picker_app/feature/country_state_picker/domain/entities/location_item.dart';
import 'package:location_picker_app/feature/country_state_picker/domain/repositories/location_repository.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepository _locationRepository;

  LocationCubit(this._locationRepository) : super(LocationInitial());

  List<LocationItem> _countries = [];
  List<LocationItem> _states = [];
  LocationItem? _selectedCountry;
  LocationItem? _selectedState;

  List<LocationItem> get countries => _countries;

  List<LocationItem> get states => _states;

  LocationItem? get selectedCountry => _selectedCountry;

  LocationItem? get selectedState => _selectedState;

  Future<void> loadCountries() async {
    emit(LocationLoading());
    try {
      _countries = await _locationRepository.getCountries();
      emit(
        _countries.isEmpty
            ? LocationError(AppConst.noCountriesAvailable)
            : CountriesLoaded(_countries),
      );
    } catch (error) {
      emit(LocationError("Failed to load countries: $error"));
    }
  }

  Future<void> loadStates(int countryId) async {
    emit(LocationLoading());
    try {
      _states = await _locationRepository.getStatesByCountryId(countryId);
      emit(StatesLoaded(_states, _countries));
    } catch (error) {
      emit(LocationError("Failed to load states: $error"));
    }
  }

  void updateSelectedCountry(LocationItem? country) {
    _selectedCountry = country;
    _selectedState = null;
    _states = [];
    emit(CountriesLoaded(_countries));
    if (country != null) {
      loadStates(country.id);
    }
  }

  void updateSelectedState(LocationItem? state) {
    _selectedState = state;
    emit(StatesLoaded(_states, _countries, selectedState: _selectedState));
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_picker_app/feature/country_state_picker/domain/repositories/location_repository.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepository repository;

  LocationCubit(this.repository) : super(LocationInitial());

  Future<void> fetchCountries() async {
    emit(LocationLoading());
    try {
      final countries = await repository.getCountries();
      emit(CountriesLoaded(countries));
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }

  Future<void> fetchStates(int countryId) async {
    emit(LocationLoading());
    try {
      final states = await repository.getStatesByCountryId(countryId);
      emit(StatesLoaded(states));
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }
}

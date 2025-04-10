import 'package:location_picker_app/feature/country_state_picker/domain/entities/location_item.dart';

abstract class LocationRepository {
  Future<List<LocationItem>> getCountries();

  Future<List<LocationItem>> getStatesByCountryId(int countryId);
}

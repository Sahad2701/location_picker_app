import 'package:location_picker_app/core/constants/api_endpoints.dart';
import 'package:location_picker_app/core/network/dio_client.dart';
import 'package:location_picker_app/core/network/api_result.dart';
import 'package:location_picker_app/feature/country_state_picker/data/models/location_item_model.dart';
import 'package:location_picker_app/feature/country_state_picker/domain/entities/location_item.dart';
import 'package:location_picker_app/feature/country_state_picker/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final DioClient dioClient;

  LocationRepositoryImpl(this.dioClient);

  @override
  Future<List<LocationItem>> getCountries() async {
    final result = await dioClient.get(ApiEndpoints.countries);

    if (result is ApiSuccess) {
      try {
        return (result.data as List)
            .map((e) => LocationItemModel.fromJson(e).toEntity())
            .toList()
            .cast<LocationItem>();
      } catch (e) {
        throw Exception('[getCountries] Parse error: $e');
      }
    } else if (result is ApiFailure) {
      throw Exception('[getCountries] ${result.message}');
    } else {
      throw Exception('[getCountries] Unexpected error');
    }
  }

  @override
  Future<List<LocationItem>> getStatesByCountryId(int countryId) async {
    final result = await dioClient.get(
      ApiEndpoints.statesByCountryId(countryId),
    );

    if (result is ApiSuccess) {
      try {
        return (result.data as List)
            .map((e) => LocationItemModel.fromJson(e).toEntity())
            .toList()
            .cast<LocationItem>();
      } catch (e) {
        throw Exception('[getStatesByCountryId] Parse error: $e');
      }
    } else if (result is ApiFailure) {
      throw Exception('[getStatesByCountryId] ${result.message}');
    } else {
      throw Exception('[getStatesByCountryId] Unexpected error');
    }
  }
}

import 'package:location_picker_app/core/constants/api_endpoints.dart';
import 'package:location_picker_app/core/network/dio_client.dart';
import 'package:location_picker_app/core/network/api_result.dart';
import 'package:location_picker_app/feature/country_state_picker/data/models/location_item_model.dart';

class LocationRemoteDataSource {
  final DioClient dioClient;

  LocationRemoteDataSource(this.dioClient);

  Future<List<LocationItemModel>> getCountries() async {
    final result = await dioClient.get(ApiEndpoints.countries);

    if (result is ApiSuccess) {
      try {
        return (result.data as List)
            .map((e) => LocationItemModel.fromJson(e))
            .toList();
      } catch (e) {
        throw Exception('[DataSource][getCountries] Parse error: $e');
      }
    } else if (result is ApiFailure) {
      throw Exception('[DataSource][getCountries] ${result.message}');
    } else {
      throw Exception('[DataSource][getCountries] Unknown error');
    }
  }

  Future<List<LocationItemModel>> getStatesByCountryId(int countryId) async {
    final result = await dioClient.get(
      ApiEndpoints.statesByCountryId(countryId),
    );

    if (result is ApiSuccess) {
      try {
        return (result.data as List)
            .map((e) => LocationItemModel.fromJson(e))
            .toList();
      } catch (e) {
        throw Exception('[DataSource][getStatesByCountryId] Parse error: $e');
      }
    } else if (result is ApiFailure) {
      throw Exception('[DataSource][getStatesByCountryId] ${result.message}');
    } else {
      throw Exception('[DataSource][getStatesByCountryId] Unknown error');
    }
  }
}

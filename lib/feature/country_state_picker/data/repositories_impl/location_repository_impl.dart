// lib/feature/country_state_picker/data/repositories_impl/location_repository_impl.dart

import 'package:location_picker_app/feature/country_state_picker/data/datasources/location_remote_data_source.dart';
import 'package:location_picker_app/feature/country_state_picker/data/models/location_item_model.dart';
import 'package:location_picker_app/feature/country_state_picker/domain/entities/location_item.dart';
import 'package:location_picker_app/feature/country_state_picker/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;

  LocationRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<LocationItem>> getCountries() async {
    try {
      final models = await remoteDataSource.getCountries();
      return models.map((e) => e.toEntity()).toList();
    } catch (e) {
      throw Exception('[Repo][getCountries] $e');
    }
  }

  @override
  Future<List<LocationItem>> getStatesByCountryId(int countryId) async {
    try {
      final models = await remoteDataSource.getStatesByCountryId(countryId);
      return models.map((e) => e.toEntity()).toList();
    } catch (e) {
      throw Exception('[Repo][getStatesByCountryId] $e');
    }
  }
}

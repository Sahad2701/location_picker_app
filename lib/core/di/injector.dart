import 'package:get_it/get_it.dart';
import 'package:location_picker_app/feature/country_state_picker/data/repositories_impl/location_repository_impl.dart';
import '../../feature/country_state_picker/data/datasources/location_remote_data_source.dart';
import '../../feature/country_state_picker/domain/repositories/location_repository.dart';
import '../../feature/country_state_picker/presentation/cubit/location_cubit.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Core
  sl.registerLazySingleton<DioClient>(() => DioClient());

  /// Repositories
  sl.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(sl()),
  );

  // Data Source
  sl.registerLazySingleton(() => LocationRemoteDataSource(sl()));

  // Cubit
  sl.registerFactory(() => LocationCubit(sl()));
}

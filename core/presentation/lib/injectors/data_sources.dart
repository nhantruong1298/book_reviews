import 'package:data/data_source/data_storage.dart';
import 'package:data/mapper/firebase_auth_data_mapper.dart';
import 'package:data/networking/service_manager.dart';
import 'package:data/repository/log_service_impl.dart';
import 'package:domain/repository/log_service.dart';
import 'package:get_it/get_it.dart';

class DataSourceInjector {
  static void configureRepository(GetIt getIt) {
    _registerDataMapper(getIt);
    _registerDataStore(getIt);
  }

  static void _registerDataStore(
    GetIt getIt,
  ) {
    getIt.registerLazySingleton<LogService>(() => LogServiceImpl());
    getIt.registerLazySingleton<DataStorage>(() => DataStorage());

    getIt.registerSingleton<ServiceManager>(ServiceManager(
      getIt<DataStorage>(),
      getIt<LogService>(),
    ));
  }

  static void _registerDataMapper(GetIt getIt) {
    getIt.registerLazySingleton<DataMapperInjector>(() => DataMapperInjector());
  }
}

class DataMapperInjector {
   FirebaseAuthDataMapper get firebaseAuthDataMapper => FirebaseAuthDataMapper();

  // BlogDataMapper get blogDataMapper => BlogDataMapper();
}

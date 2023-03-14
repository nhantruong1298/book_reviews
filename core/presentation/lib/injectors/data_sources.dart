import 'package:get_it/get_it.dart';

class DataSourceInjector {
  static void configureRepository(GetIt getIt) {
    _registerDataMapper(getIt);
    _registerDataStore(getIt);
  }

  static void _registerDataStore(
    GetIt getIt,
  ) {
    // getIt.registerLazySingleton<LogService>(() => LogServiceImpl());
    // getIt.registerLazySingleton<DataStorage>(() => DataStorage());

    // getIt.registerSingleton<ServiceManager>(ServiceManager(
    //   getIt<DataStorage>(),
    //   getIt<LogService>(),
    // ));
  }

  static void _registerDataMapper(GetIt getIt) {
    getIt.registerLazySingleton<DataMapperInjector>(() => DataMapperInjector());
  }
}

class DataMapperInjector {
  // TopicDataMapper get topicDataMapper => TopicDataMapper();

  // BlogDataMapper get blogDataMapper => BlogDataMapper();
}

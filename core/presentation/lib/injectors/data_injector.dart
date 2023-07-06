import 'package:data/data_source/data_storage.dart';
import 'package:data/mapper/book_data_mapper.dart';
import 'package:data/mapper/firebase_auth_data_mapper.dart';
import 'package:data/networking/service_manager.dart';
import 'package:data/repository/book_repository_impl.dart';
import 'package:data/repository/firebase_auth_repository_impl.dart';
import 'package:data/repository/log_service_impl.dart';
import 'package:data/repository/user_repository_impl.dart';
import 'package:domain/repository/book_repository.dart';
import 'package:domain/repository/firebase_auth_repository.dart';
import 'package:domain/repository/log_service.dart';
import 'package:domain/repository/user_repository.dart';
import 'package:get_it/get_it.dart';

class DataInjector {
  static void configure(GetIt getIt) {
    _configureDataStore(getIt);
    _configureDataMapper(getIt);
    _configureRepository(getIt);
  }

  static void _configureDataStore(GetIt getIt) {
    getIt.registerLazySingleton<LogService>(() => LogServiceImpl());
    getIt.registerLazySingleton<DataStorage>(() => DataStorage());

    getIt.registerSingleton<ServiceManager>(ServiceManager(
      getIt<DataStorage>(),
      getIt<LogService>(),
    ));
  }

  static void _configureDataMapper(GetIt getIt) {
    getIt.registerLazySingleton<FirebaseAuthDataMapper>(
        () => FirebaseAuthDataMapper());

    getIt.registerLazySingleton<BookDataMapper>(() => BookDataMapper());
  }

  static void _configureRepository(GetIt getIt) {
    getIt.registerLazySingleton<FirebaseAuthRepository>(() =>
        FirebaseAuthRepositoryImpl(
            getIt<ServiceManager>(), getIt<FirebaseAuthDataMapper>()));

    getIt.registerLazySingleton<BookRepository>(() => BookRepositoryImpl(
          getIt<ServiceManager>(),
          getIt<BookDataMapper>(),
        ));

    getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
          getIt<ServiceManager>(),
        ));
  }
}

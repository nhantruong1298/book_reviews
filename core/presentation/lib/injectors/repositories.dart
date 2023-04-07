import 'package:data/networking/service_manager.dart';
import 'package:data/repository/firebase_auth_repository_impl.dart';
import 'package:domain/repository/firebase_auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/injectors/data_sources.dart';

class RepositoryInjector {
  static void configureRepository(GetIt getIt) {
    final dataMapperInjector = getIt<DataMapperInjector>();

    getIt.registerLazySingleton<FirebaseAuthRepository>(
        () => FirebaseAuthRepositoryImpl(
              getIt<ServiceManager>(),
              dataMapperInjector.firebaseAuthDataMapper,
            ));

    // getIt.registerLazySingleton<TopicRepository>(
    //     () => TopicRepositoryImpl(getIt<ServiceManager>(),dataMapperInjector.topicDataMapper));

    //  getIt.registerLazySingleton<BlogRepository>(
    //     () => BlogRepositoryImpl(getIt<ServiceManager>(),dataMapperInjector.blogDataMapper));
  }
}

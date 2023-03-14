import 'package:get_it/get_it.dart';

class RepositoryInjector {
  static void configureRepository(GetIt getIt) {
    // final dataMapperInjector = getIt<DataMapperInjector>();

    // getIt.registerLazySingleton<FirebaseAuthRepository>(
    //     () => FirebaseAuthRepositoryImpl(getIt<ServiceManager>()));

    // getIt.registerLazySingleton<TopicRepository>(
    //     () => TopicRepositoryImpl(getIt<ServiceManager>(),dataMapperInjector.topicDataMapper));

    //  getIt.registerLazySingleton<BlogRepository>(
    //     () => BlogRepositoryImpl(getIt<ServiceManager>(),dataMapperInjector.blogDataMapper));
  }
}

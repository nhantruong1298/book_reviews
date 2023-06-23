import 'dart:async';

import 'package:domain/repository/log_service.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/exception/app.exception_handler.dart';
import 'package:presentation/exception/app_global_exception_handler.dart';
import 'package:presentation/injectors/data_injector.dart';


final getIt = GetIt.instance;

FutureOr<GetIt> configureDependencies() async {
  DataInjector.configure(getIt);

  // * AppGlobalExceptionHandler
  getIt.registerLazySingleton<AppGlobalExceptionHandler>(
      () => AppGlobalExceptionHandler());

  //* AppExceptionHandler
  getIt.registerLazySingleton<AppExceptionHandler>(() => AppExceptionHandler(
      getIt<AppGlobalExceptionHandler>(), getIt<LogService>()));

  return getIt;
}

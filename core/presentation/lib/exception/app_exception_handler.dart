// import 'package:flutter/foundation.dart';
import 'package:data/mapper/error_data_mapper.dart';
import 'package:domain/exception/business_exception.dart';
import 'package:domain/exception/business_exception_code.dart';
import 'package:domain/repository/log_service.dart';
import 'package:presentation/exception/app_global_exception_handler.dart';

import 'app_exception.dart';

class AppExceptionHandler {
  final AppGlobalExceptionHandler _globalExceptionHandler;
  final LogService _logService;

  AppExceptionHandler(this._globalExceptionHandler, this._logService);

  AppException map(dynamic error,
      {StackTrace? stackTrace, bool showErrorDetail = false}) {
    BusinessException? businessException;

    if (error is! BusinessException) {
      //TODO: Open when implement Firebase Crashlytics

      // if (!kDebugMode) FirebaseCrashlytics.instance.recordError(e, stackTrace);

      final businessException = ErrorDataMapper.mapFirebaseException(error);

      _logService.error(businessException.debugMessage, error, stackTrace);

      return AppException(businessException.debugMessage,
          exceptionCode: businessException.businessExceptionCode,
          originalException: error);
    } else {
      businessException = error;
    }

    //handleGlobalExceptionIfNeed(businessException, stackTrace);
    String displayMessage;

    if (businessException.debugMessage != null) {
      //TODO: Open when implement Firebase Crashlytics

      // FirebaseCrashlytics.instance.recordError(businessException, stackTrace);

      displayMessage = businessException.debugMessage ?? '';
      // if (showErrorDetail && businessException.errorDetails.isNotEmpty) {
      //   displayMessage = businessException.errorDetails.join("\n");
      // }

      _logService.error(displayMessage, error, stackTrace);
      return AppException(displayMessage,
          originalException: businessException,
          exceptionCode: businessException.businessExceptionCode);
    }
    // final String? formatter =
    //     _exceptionMessageMap[businessException.businessExceptionCode];

    displayMessage = "Unexpected exception";

    // formatter != null
    // ? formatter(businessException.errorDetails)
    // :
    _logService.error(displayMessage, error, stackTrace);
    return AppException(displayMessage,
        exceptionCode: businessException.businessExceptionCode,
        originalException: businessException);
  }

  AppException mapFirebaseException(dynamic error,
      {StackTrace? stackTrace, bool showErrorDetail = false}) {
    BusinessExceptionCode businessExceptionCode = BusinessExceptionCode.UNEXPECTED_ERROR;

   
    String displayMessage;

    displayMessage = "Unexpected exception";

    _logService.error(displayMessage, error, stackTrace);
    return AppException(displayMessage,
        exceptionCode: businessExceptionCode,
        originalException: error);
  }

  void handleGlobalExceptionIfNeed(
      BusinessException e, StackTrace? stackTrace) {
    if (!_globalExceptionHandler.isGlobalException(e)) {
      return;
    }
    bool keepHandlingError =
        _globalExceptionHandler.handleGlobalException(e, stackTrace);
    if (!keepHandlingError) {
      throw e;
    }
  }
}

// typedef MapFunction = String Function(List<ExceptionReference>? exDetails);

// Map<BusinessExceptionCode, String> _exceptionMessageMap = {};

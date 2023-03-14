// import 'package:flutter/foundation.dart';
import 'package:domain/exception/business_exception.dart';
import 'package:presentation/exception/app_global_exception_handler.dart';

import 'app_exception.dart';

class AppExceptionHandler {
  final AppGlobalExceptionHandler _globalExceptionHandler;

  AppExceptionHandler(this._globalExceptionHandler);

  AppException map(dynamic e,
      {StackTrace? stackTrace, bool showErrorDetail = false}) {
    BusinessException? businessException;

    if (e is! BusinessException) {
      // if (!kDebugMode) FirebaseCrashlytics.instance.recordError(e, stackTrace);

      return AppException("Unexpected exception",
          originalException: e);
    } else {
      businessException = e;
    }

    handleGlobalExceptionIfNeed(businessException, stackTrace);
    String displayMessage;

    if (businessException.debugMessage != null) {
      // FirebaseCrashlytics.instance.recordError(businessException, stackTrace);
      displayMessage = businessException.debugMessage ?? '';
      // if (showErrorDetail && businessException.errorDetails.isNotEmpty) {
      //   displayMessage = businessException.errorDetails.join("\n");
      // }
      return AppException(displayMessage,
          originalException: businessException,
          exceptionCode: businessException.businessExceptionCode);
    }
    // final String? formatter =
    //     _exceptionMessageMap[businessException.businessExceptionCode];

    displayMessage =
        // formatter != null
        // ? formatter(businessException.errorDetails)
        // :
        "Unexpected exception";

    return AppException(displayMessage,
        exceptionCode: businessException.businessExceptionCode,
        originalException: businessException);
  }

  handleGlobalExceptionIfNeed(BusinessException e, StackTrace? stackTrace) {
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

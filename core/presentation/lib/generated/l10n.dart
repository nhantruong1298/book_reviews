// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Email`
  String get SIGN_UP__EMAIL {
    return Intl.message(
      'Email',
      name: 'SIGN_UP__EMAIL',
      desc: '',
      args: [],
    );
  }

  /// `Không được để trống`
  String get SIGN_UP__CAN_NOT_BE_LEFT_BLANK {
    return Intl.message(
      'Không được để trống',
      name: 'SIGN_UP__CAN_NOT_BE_LEFT_BLANK',
      desc: '',
      args: [],
    );
  }

  /// `Email không hợp lệ`
  String get SIGN_UP__EMAIL_INVALID {
    return Intl.message(
      'Email không hợp lệ',
      name: 'SIGN_UP__EMAIL_INVALID',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu`
  String get SIGN_UP__PASSWORD {
    return Intl.message(
      'Mật khẩu',
      name: 'SIGN_UP__PASSWORD',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu không trùng khớp`
  String get SIGN_UP__PASSWORD_DOES_NOT_MATCH {
    return Intl.message(
      'Mật khẩu không trùng khớp',
      name: 'SIGN_UP__PASSWORD_DOES_NOT_MATCH',
      desc: '',
      args: [],
    );
  }

  /// `Nhập lại mật khẩu`
  String get SIGN_UP__RE_ENTER_PASSWORD {
    return Intl.message(
      'Nhập lại mật khẩu',
      name: 'SIGN_UP__RE_ENTER_PASSWORD',
      desc: '',
      args: [],
    );
  }

  /// `<p>Email xác thực đã được gửi tới <span>{email}</span>. Nhấn vào link bên trong để bắt đầu!</p>`
  String SIGN_UP_SUCCESS_DESCRIPTION(Object email) {
    return Intl.message(
      '<p>Email xác thực đã được gửi tới <span>$email</span>. Nhấn vào link bên trong để bắt đầu!</p>',
      name: 'SIGN_UP_SUCCESS_DESCRIPTION',
      desc: '',
      args: [email],
    );
  }

  /// `Đăng ký thành công`
  String get SIGN_UP_SUCCESS__SIGN_UP_SUCCESS {
    return Intl.message(
      'Đăng ký thành công',
      name: 'SIGN_UP_SUCCESS__SIGN_UP_SUCCESS',
      desc: '',
      args: [],
    );
  }

  /// `Không nhận được email? `
  String get SIGN_UP___DID_NOT_GET_EMAIL {
    return Intl.message(
      'Không nhận được email? ',
      name: 'SIGN_UP___DID_NOT_GET_EMAIL',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập`
  String get SIGN_UP_SUCCESS__BACK_TO_SIGN_IN {
    return Intl.message(
      'Đăng nhập',
      name: 'SIGN_UP_SUCCESS__BACK_TO_SIGN_IN',
      desc: '',
      args: [],
    );
  }

  /// `Gửi lại `
  String get SIGN_UP___RESEND {
    return Intl.message(
      'Gửi lại ',
      name: 'SIGN_UP___RESEND',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu tối da {value} kí tự`
  String SIGN_UP__VALIDATION_PASSWORD_INVALID_MIN_LENGTH(Object value) {
    return Intl.message(
      'Mật khẩu tối da $value kí tự',
      name: 'SIGN_UP__VALIDATION_PASSWORD_INVALID_MIN_LENGTH',
      desc: '',
      args: [value],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

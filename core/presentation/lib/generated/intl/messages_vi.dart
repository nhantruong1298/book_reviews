// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'vi';

  static String m0(email) =>
      "<p>Email xác thực đã được gửi tới <span>${email}</span>. Nhấn vào link bên trong để bắt đầu!</p>";

  static String m1(value) => "Mật khẩu tối da ${value} kí tự";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "SIGN_UP_SUCCESS_DESCRIPTION": m0,
        "SIGN_UP_SUCCESS__BACK_TO_SIGN_IN":
            MessageLookupByLibrary.simpleMessage("Đăng nhập"),
        "SIGN_UP_SUCCESS__SIGN_UP_SUCCESS":
            MessageLookupByLibrary.simpleMessage("Đăng ký thành công"),
        "SIGN_UP__CAN_NOT_BE_LEFT_BLANK":
            MessageLookupByLibrary.simpleMessage("Không được để trống"),
        "SIGN_UP__EMAIL": MessageLookupByLibrary.simpleMessage("Email"),
        "SIGN_UP__EMAIL_INVALID":
            MessageLookupByLibrary.simpleMessage("Email không hợp lệ"),
        "SIGN_UP__PASSWORD": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
        "SIGN_UP__PASSWORD_DOES_NOT_MATCH":
            MessageLookupByLibrary.simpleMessage(
                "Mật khẩu không trùng khớp"),
        "SIGN_UP__RE_ENTER_PASSWORD":
            MessageLookupByLibrary.simpleMessage("Nhập lại mật khẩu"),
        "SIGN_UP__VALIDATION_PASSWORD_INVALID_MIN_LENGTH": m1,
        "SIGN_UP___DID_NOT_GET_EMAIL":
            MessageLookupByLibrary.simpleMessage("Không nhận được email? "),
        "SIGN_UP___RESEND": MessageLookupByLibrary.simpleMessage("Gửi lại ")
      };
}

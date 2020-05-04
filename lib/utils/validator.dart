import 'package:automation_testing_module/utils/constants.dart';

class Validator {
  static String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@'
        r'((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return Constants.ENTER_EMAIL;
    }

    if (!regExp.hasMatch(value)) {
      return Constants.INVALID_EMAIL;
    }
    return null;
  }

  static String validatePassword(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$?^&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);

    if (value.isEmpty)
      return Constants.ENTER_PASSWORD;
    else if (value.length < 8)
      return Constants.INVALID_PASSWORD;
    else if (!regex.hasMatch(value))
      return Constants.INVALID_FORMAT_PASSWORD;

    return null;
  }
}

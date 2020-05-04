import 'package:automation_testing_module/utils/constants.dart';
import 'package:automation_testing_module/utils/validator.dart';
import 'package:test/test.dart';

void main() {
  //Email validation test

  test('Email Not Entered Test', () {
    var result = Validator.validateEmail('');
    expect(result, Constants.ENTER_EMAIL);
  });

  test('Inavlid Email Entered Test', () {
    var result = Validator.validateEmail('akshay@aeologic');
    expect(result, Constants.INVALID_EMAIL);
  });

 test('Valid Email Entered Test', () {
    var result = Validator.validateEmail('akshay@aeologic.com');
    expect(result, null);
  });

  //Password validation test

  test('Password Not Entered Test', () {
    var result = Validator.validatePassword('');
    expect(result, Constants.ENTER_PASSWORD);
  });

  test('Inavlid Password Entered Test', () {
    var result = Validator.validatePassword('1234567');
    expect(result, Constants.INVALID_PASSWORD);
  });

  test('Inavlid Password Format Entered Test', () {
    var result = Validator.validatePassword('unittest');
    expect(result, Constants.INVALID_FORMAT_PASSWORD);
  });

  test('Valid Password Test', () {
    var result = Validator.validatePassword('Unittest@123');
    expect(result, null);
  });

}
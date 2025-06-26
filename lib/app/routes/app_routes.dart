part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const SIGNUP = _Paths.SIGNUP;
  static const WELCOME = _Paths.WELCOME;
  static const HOME = _Paths.HOME;
  static const PROFILE = _Paths.PROFILE;
  static const CAME = _Paths.CAME;
  static const RESULT = _Paths.RESULT;
  static const RESULT_01 = _Paths.RESULT_01;
  static const RESULT_02 = _Paths.RESULT_02;
  static const RESULT_03 = _Paths.RESULT_03;
}

abstract class _Paths {
  _Paths._();
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
  static const WELCOME = '/welcome';
  static const HOME = '/homepage';
  static const PROFILE = '/profile';
  static const CAME = '/camdetect';
  static const RESULT = '/result';
  static const RESULT_01 = '/result01';
  static const RESULT_02 = '/result02';
  static const RESULT_03 = '/result03';
}

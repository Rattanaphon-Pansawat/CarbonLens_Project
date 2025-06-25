part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const CAME = _Paths.CAME;
  static const RESULT = _Paths.RESULT;
}

abstract class _Paths {
  _Paths._();
  static const LOGIN = '/login';
  static const HOME = '/homepage';
  static const CAME = '/camdetect';
  static const RESULT = '/result';
}

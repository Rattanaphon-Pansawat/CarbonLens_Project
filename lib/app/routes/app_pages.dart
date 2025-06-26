import 'package:get/get.dart';

// Login
import '../modules/login_page/bindings/login_binding.dart';
import '../modules/login_page/views/login_view.dart';

// Signup
import '../modules/signup_page/bindings/signup_binding.dart';
import '../modules/signup_page/views/signup_view.dart';

// Welcome
import '../modules/welcome_page/bindings/welcome_binding.dart';
import '../modules/welcome_page/views/welcome_view.dart';

// Home
import '../modules/home_page/bindings/home_binding.dart';
import '../modules/home_page/views/home_view.dart';

// Profile
import '../modules/profile_page/bindings/profile_binding.dart';
import '../modules/profile_page/views/profile_view.dart';

// Camera Detection
import '../modules/camdetect/bindings/cam_binding.dart';
import '../modules/camdetect/views/cam_view.dart';

// Result
import '../modules/result/bindings/result_binding.dart';
import '../modules/result/views/result_view.dart';

// Result 01
import '../modules/result_01/bindings/result01_binding.dart';
import '../modules/result_01/views/result01_view.dart';

// Result 02
import '../modules/result_02/bindings/result02_binding.dart';
import '../modules/result_02/views/result02_view.dart';

// Result 03
import '../modules/result_03/bindings/result03_binding.dart';
import '../modules/result_03/views/result03_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CAME,
      page: () => const CameView(),
      binding: CameBinding(),
    ),
    GetPage(
      name: _Paths.RESULT,
      page: () => const ResultView(),
      binding: ResultBinding(),
    ),
    GetPage(
      name: _Paths.RESULT_01,
      page: () => const Result01View(),
      binding: Result01Binding(),
    ),
    GetPage(
      name: _Paths.RESULT_02,
      page: () => const ResultView(),
      binding: ResultBinding(),
    ),
    GetPage(
      name: _Paths.RESULT_03,
      page: () => const Result03View(),
      binding: Result03Binding(),
    ),
  ];
}

import 'package:eduline/presentation/screens/home_page/home_page.dart';
import 'package:eduline/presentation/screens/home_page/select_language_screen.dart';
import 'package:eduline/presentation/screens/login_screen/forgot_password/forgot_password_email_screen.dart';
import 'package:eduline/presentation/screens/login_screen/forgot_password/reset_password_screen.dart';
import 'package:eduline/presentation/screens/login_screen/forgot_password/verify_code_screen.dart';
import 'package:eduline/presentation/screens/login_screen/signin_screen.dart';
import 'package:eduline/presentation/screens/onbording_screen/onboarding_screen.dart';
import 'package:eduline/presentation/screens/onbording_screen/splash_screen.dart';
import 'package:get/get.dart';

import '../../handler_screen.dart';
import '../../presentation/screens/home_page/enable_location_screen.dart';
import '../../presentation/screens/login_screen/signup_screen.dart';
import '../../presentation/screens/posts_screen/view/api_data_viewer.dart';

class AppRoutes {
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const login = '/signin';
  static const signup = '/signup';
  static const homePage = '/homePage';
  static const forgotPassEmail = '/forgotPassEmail';
  static const resetPass = '/resetPass';
  static const verifyCode = '/verifyCode';
  static const enableLocationScreen = '/enableLocationScreen';
  static const selectLanguage = '/selectLanguage';
  static const handlerScreen = '/handlerScreen';
  static const apiDataCallScreen = '/apiDataCallScreen';
}

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.onboarding, page: () => OnboardingScreen()),
    GetPage(name: AppRoutes.login, page: () => SignInScreen()),
    GetPage(name: AppRoutes.signup, page: () => SignUpScreen()),
    GetPage(name: AppRoutes.homePage, page: () => HomePage()),
    GetPage(
      name: AppRoutes.forgotPassEmail,
      page: () => ForgotPasswordEmailScreen(),
    ),
    GetPage(name: AppRoutes.resetPass, page: () => ResetPasswordScreen()),
    GetPage(name: AppRoutes.verifyCode, page: () => VerifyCodeScreen()),
    GetPage(
      name: AppRoutes.enableLocationScreen,
      page: () => EnableLocationScreen(),
    ),
    GetPage(name: AppRoutes.selectLanguage, page: () => SelectLanguageScreen()),
    GetPage(name: AppRoutes.apiDataCallScreen, page: () => ApiCallingScreen()),
    GetPage(name: AppRoutes.handlerScreen, page: () => HandlerScreen()),
  ];
}

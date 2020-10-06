import 'package:flutter/widgets.dart';
import 'package:smartq/pages/on_boarding/onboarding_screen.dart';
import 'package:smartq/pages/forgot_password/forgot_password_screen.dart';
import 'package:smartq/pages/sign_in/sign_in_screen.dart';
import 'package:smartq/pages/sign_up/sign_up_screen.dart';
import 'package:smartq/pages/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  //SplashContent.routeName: (context) => SplashContent(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
};

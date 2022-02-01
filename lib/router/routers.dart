import 'package:flutter/material.dart';
import 'package:Gamegig/views/accoutssetup/create_account_view.dart';
import 'package:Gamegig/views/authentication_view/otpverification/otpverification.dart';
import 'package:Gamegig/views/authentication_view/phonelogin/phonelogin_view.dart';
import 'package:Gamegig/views/views.dart';

const String loginPage = 'login';
const String accountSetupPage = 'accountSetupPage';
const String onboardingScreen = 'onboardingScreen';
const String authView = 'authView';
const String enterOtpView = 'enterOtpView';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => const PhoneLoginView());
    case accountSetupPage:
      return MaterialPageRoute(builder: (context) => const CreateAccount());
    case authView:
      return MaterialPageRoute(
          builder: (context) => const AuthenticationView());
    case enterOtpView:
      return MaterialPageRoute(
          builder: (context) => const EnterOtpView(
                mobileNo: '64564556',
              ));
    case onboardingScreen:
      return MaterialPageRoute(builder: (context) => const OnboardingScreen());
    default:
      throw ('this route name does not exist');
  }
}

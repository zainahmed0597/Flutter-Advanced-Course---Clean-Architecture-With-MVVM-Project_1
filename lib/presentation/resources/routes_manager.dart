import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_1/presentation/forget_password/forget_password.dart';
import 'package:project_1/presentation/login/login.dart';
import 'package:project_1/presentation/main/main_view.dart';
import 'package:project_1/presentation/onboarding/onboarding.dart';
import 'package:project_1/presentation/register/register.dart';
import 'package:project_1/presentation/resources/strings_manager.dart';
import 'package:project_1/presentation/splash/splash.dart';
import 'package:project_1/presentation/store_details/store_details.dart';

import '../../app/di.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.registerRoute:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.forgotPasswordRoute:
        initForgotPasswordModule();
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case Routes.mainRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.storeDetailsRoute:
        initStoreDetailsModule();
        return MaterialPageRoute(builder: (_) => StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.noRouteFound).tr(),
          ),
          body: Center(child: Text(AppStrings.noRouteFound).tr()),
        ));
  }
}

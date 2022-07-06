import 'package:flutter/material.dart';
import '../factories/factories.dart';

class AppRoute {
  AppRoute({
    required this.name,
    required this.child,
  });

  final String name;
  final Widget Function(AppRouteArguments args) child;
}

class AppRouteArguments {
  final dynamic data;

  AppRouteArguments(this.data);
}

class AppRoutes {
  AppRoutes._();

  static const splashPage = '/';
  static const homePage = 'home';
  static const loginPage = 'login';
  static const signUp = 'signUp';

  static List<AppRoute> get routesList => [
        AppRoute(
          name: splashPage,
          child: (_) => makeSplashPage(),
        ),
        AppRoute(
          name: loginPage,
          child: (_) => makeLoginPage(),
        ),
        AppRoute(
          name: homePage,
          child: (_) => makeHomePage(),
        ),
        AppRoute(
          name: signUp,
          child: (_) => makeSignUpPage(),
        ),
      ];
}

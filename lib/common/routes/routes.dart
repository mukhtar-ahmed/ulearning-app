import 'package:flutter/material.dart';
import 'package:ulearning_app/pages/application/application.dart';
import 'package:ulearning_app/pages/global.dart';
// import 'package:ulearning_app/pages/home.dart';
import 'package:ulearning_app/pages/login/view/login_page.dart';
import 'package:ulearning_app/pages/registration/view/register_page.dart';
import 'package:ulearning_app/pages/unboarding/unboarding_screen.dart';

class Routes {
  static List<RoutesEntity> routesList = [
    RoutesEntity(path: UnboardingScreen.id, screen: UnboardingScreen()),
    RoutesEntity(path: LoginPage.id, screen: LoginPage()),
    RoutesEntity(path: RegisterPage.id, screen: RegisterPage()),
    // RoutesEntity(path: Home.id, screen: Home()),
    RoutesEntity(path: Application.id, screen: Application())
  ];

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print(settings.name);
    final matchedRoute = routesList.firstWhere(
      (route) => route.path == settings.name,
      orElse: () =>
          RoutesEntity(path: UnboardingScreen.id, screen: UnboardingScreen()),
    );

    if (matchedRoute.path == UnboardingScreen.id &&
        Global.storageService.getDeviceOpenFirstTime()) {
      return Global.storageService.getUserToken()
          ? MaterialPageRoute(builder: (_) => Application())
          : MaterialPageRoute(builder: (_) => LoginPage());
    } else {
      return MaterialPageRoute(builder: (_) => matchedRoute.screen);
    }
  }
}

class RoutesEntity {
  final String path;
  final Widget screen;

  RoutesEntity({required this.path, required this.screen});
}

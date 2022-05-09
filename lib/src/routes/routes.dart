import 'package:flutter/material.dart';
import 'package:huellitas/src/pages/error_page.dart';
import 'package:huellitas/src/pages/home_page.dart';
import 'package:huellitas/src/pages/login_page.dart';
import 'package:huellitas/src/pages/map_page.dart';
import 'package:huellitas/src/pages/register_page.dart';

class RoutePaths {
  static const loginPage = "login";
  static const registerPage = "register";
  static const homePage = "home";
  static const mapPage = "map";
}

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.loginPage:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case RoutePaths.registerPage:
        return MaterialPageRoute(builder: (context) => RegisterPage());
      case RoutePaths.homePage:
        return MaterialPageRoute(builder: (context) => HomePage());
      case RoutePaths.mapPage:
        return MaterialPageRoute(builder: (context) => MapPage());
      default:
        return MaterialPageRoute(builder: (context) => ErrorPage());
    }
  }
}

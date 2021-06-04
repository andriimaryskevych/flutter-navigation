import 'package:flutter/material.dart';
import 'package:navigation_app/pages/error.dart';
import 'package:navigation_app/pages/first.dart';
import 'package:navigation_app/pages/second.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FirstPage());
      case '/second':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => SecondPage(
              data: args,
            ),
          );
        }

        // return RouteGenerator.errorRoute() or onUnmatchedRoute
        break;
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(builder: (_) => ErrorPage());
  }
}

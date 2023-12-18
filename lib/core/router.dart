import 'package:flutter/material.dart';
import 'package:search_repo/presentation/export.dart';

class AppRouter {
  static PageRouteBuilder<void> builder(Widget widget, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(microseconds: 300),
      reverseTransitionDuration: const Duration(microseconds: 300),
      pageBuilder: (
        _,
        __,
        ___,
      ) =>
          widget,
      transitionsBuilder: (_, anim, __, child) {
        return FadeTransition(
          opacity: anim,
          child: child,
        );
      },
    );
  }

  static PageRouteBuilder<void> splashBuilder(
    Widget widget,
    RouteSettings settings,
  ) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(seconds: 1),
      reverseTransitionDuration: const Duration(microseconds: 300),
      pageBuilder: (
        _,
        __,
        ___,
      ) =>
          widget,
      transitionsBuilder: (_, anim, __, child) {
        return FadeTransition(
          opacity: anim,
          child: child,
        );
      },
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable, prefer_final_locals
    dynamic data = settings.arguments;
    switch (settings.name) {
      case LoadingPage.routeName:
        {
          return splashBuilder(const LoadingPage(), settings);
        }
      case SearchPage.routeName:
        {
          return builder(const SearchPage(), settings);
        }
      case FavoritePage.routeName:
        {
          return builder(const FavoritePage(), settings);
        }
      default:
        return builder(Container(), settings);
    }
  }
}

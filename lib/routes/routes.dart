import 'package:challenge_03/add_cripto/view/add_cripto_view.dart';
import 'package:challenge_03/initial/view/initial_view.dart';
import 'package:challenge_03/routes/route_names.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case initialViewRoute:
      return _getPageRoute(
        routeName: settings.name ?? '/',
        viewToShow: const InitialView(),
      );

    case addCriptoViewRoute:
      return _getPageRoute(
        routeName: settings.name ?? '/',
        viewToShow: const AddCriptoView(),
      );
    default:
      return _getPageRoute(
        routeName: settings.name ?? '/',
        viewToShow: const InitialView(),
      );
  }
}

PageRoute _getPageRoute({
  required String routeName,
  required Widget viewToShow,
}) {
  return PageRouteBuilder<dynamic>(
    pageBuilder: (context, _, __) => viewToShow,
    transitionsBuilder: (_, animation1, __, child) =>
        FadeTransition(opacity: animation1, child: child),
  );
}

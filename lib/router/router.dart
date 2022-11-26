import 'dart:js';

import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapi/features/weather/weather_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapi/constants/router_names.dart';
import 'package:weatherapi/repositories/auth_repository.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: router,
      redirect: router._redirectLogic,
      routes: router._routes);
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.watch(authRepositoryProvider);
  }

  String? _redirectLogic(GoRouterState state) {
    final user = _ref.read(authRepositoryProvider);

    print("## _redirectLogic ## : ${state.location}");
    return null;
  }

  List<GoRoute> get _routes => [
        // GoRoute(name: 'splash', path: '/', builder: (context, _) => const SplashPage()), // 삭제
        GoRoute(
          path: '/',
          builder: (context, _) => const WeatherPage(city: 'korea'),
        )
      ];
}

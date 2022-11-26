import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapi/features/weather/weather_page.dart';
import 'package:weatherapi/router/router.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   final router = Provider.of<MyRouter>(context, listen: false).router;
  //   final router = Provider.
  //   return MaterialApp.router(
  //     routeInformationParser: router.routeInformationParser,
  //     routerDelegate: router.routerDelegate,
  //     title: 'Flutter Demo',

  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     // home: const WeatherPage(city: 'London'),
  //   );
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: "Weather App",
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

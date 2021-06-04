import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:navigation_app/route-generator.dart';
import 'package:navigation_app/services/navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerLazySingleton<NavigationService>(() => NavigationService());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: GetIt.I<NavigationService>().navigatorKey,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      onUnknownRoute: (settings) => RouteGenerator.errorRoute(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:navigation_app/pages/error.dart';
import 'package:navigation_app/pages/first.dart';
import 'package:navigation_app/pages/second.dart';

void main() {
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
      initialRoute: '/',
      routes: {
        '/': (_) => FirstPage(),
        '/second': (BuildContext context) {
          Object? args = ModalRoute.of(context)!.settings.arguments;

          if (args != null && args is String) {
            return SecondPage(data: args);
          }

          return ErrorPage();
        }
      },
    );
  }
}

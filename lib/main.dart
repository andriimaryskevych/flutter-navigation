import 'package:flutter/material.dart';
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
      routes: {'/': (_) => FirstPage(), '/second': (_) => SecondPage(data: 'Title')},
    );
  }
}

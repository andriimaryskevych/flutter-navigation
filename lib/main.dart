import 'package:flutter/material.dart';

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
      home: App(),
    );
  }
}

enum Tab { red, green, blue }

Map<int, Tab> tabMap = {
  0: Tab.red,
  1: Tab.green,
  2: Tab.blue,
};

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.color_lens,
              color: Colors.red,
            ),
            label: 'Red',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.color_lens,
              color: Colors.green,
            ),
            label: 'Green',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.color_lens,
              color: Colors.blue,
            ),
            label: 'Blue',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 5,
      ),
    );
  }
}

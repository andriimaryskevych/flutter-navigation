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

Map<int, Tab> tabIndexMap = {
  0: Tab.red,
  1: Tab.green,
  2: Tab.blue,
};

Map<Tab, Color> tabColorMap = {
  Tab.red: Colors.red,
  Tab.green: Colors.green,
  Tab.blue: Colors.blue,
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
      body: _buildBodyStack(),
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

  Widget _buildBodyStack() {
    return Stack(
      children: [
        StackNavigatorChild(Colors.red, true),
        StackNavigatorChild(Colors.green, false),
        StackNavigatorChild(Colors.blue, false),
      ],
    );
  }
}

class StackNavigatorChild extends StatelessWidget {
  final Color color;
  final bool isVisible;

  const StackNavigatorChild(this.color, this.isVisible, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !isVisible,
      child: Container(
        color: color,
      ),
    );
  }
}

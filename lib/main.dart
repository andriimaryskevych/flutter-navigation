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
      body: _buildBody(),
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

  Widget _buildBody() {
    return Container(
      color: tabColorMap[tabIndexMap[_selectedIndex]],
      child: Center(
        child: TextButton(
          child: Text(
            'PRESS',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(tabIndexMap[_selectedIndex].toString()),
                    backgroundColor: tabColorMap[tabIndexMap[_selectedIndex]],
                  ),
                  backgroundColor: tabColorMap[tabIndexMap[_selectedIndex]],
                );
              }),
            );
          },
        ),
      ),
    );
  }
}

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

enum TabItem { red, green, blue }

const Map<TabItem, String> tabName = {
  TabItem.red: 'red',
  TabItem.green: 'green',
  TabItem.blue: 'blue',
};

const Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.red: Colors.red,
  TabItem.green: Colors.green,
  TabItem.blue: Colors.blue,
};

class BottomNavigation extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  BottomNavigation({
    required this.currentTab,
    required this.onSelectTab,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(TabItem.red),
        _buildItem(TabItem.green),
        _buildItem(TabItem.blue),
      ],
      onTap: (index) => onSelectTab(TabItem.values[index]),
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: Icon(
        Icons.layers,
        color: activeTabColor[tabItem],
      ),
      label: tabName[tabItem],
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  TabItem _currentTab = TabItem.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyStack(),
      bottomNavigationBar: BottomNavigation(
        currentTab: _currentTab,
        onSelectTab: (TabItem newTab) {
          setState(() {
            _currentTab = newTab;
          });
        },
      ),
    );
  }

  Widget _buildBodyStack() {
    return Stack(
      children: [
        StackNavigatorChild(TabItem.red, _currentTab == TabItem.red),
        StackNavigatorChild(TabItem.green, _currentTab == TabItem.green),
        StackNavigatorChild(TabItem.blue, _currentTab == TabItem.blue),
      ],
    );
  }
}

class StackNavigatorChild extends StatelessWidget {
  final TabItem tab;
  final bool isVisible;

  const StackNavigatorChild(this.tab, this.isVisible, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !isVisible,
      child: Container(
        color: activeTabColor[tab],
        child: Navigator(
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            final String routeName = settings.name ?? '/';

            if (routeName == '/') {
              return MaterialPageRoute(builder: (_) {
                return ColorListPage();
              });
            }

            if (routeName == '/details') {
              final int colorIndex = settings.arguments as int;

              return MaterialPageRoute(builder: (_) {
                return ColorDetailPage(colorIndex);
              });
            }
          },
        ),
      ),
    );
  }
}

class ColorListPage extends StatelessWidget {
  const ColorListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Center'),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/details', arguments: 500);
                  },
                  child: Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blueAccent,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class ColorDetailPage extends StatelessWidget {
  final int colorIndex;

  const ColorDetailPage(this.colorIndex, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Details ' + colorIndex.toString()),
      ),
    );
  }
}

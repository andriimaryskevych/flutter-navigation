import 'package:flutter/material.dart';
import 'package:navigation_app/routes.dart';

const String tag = '---------------------------------->\n';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'First page',
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed(thirdPage, result: 'a');
              },
              child: Text('PushReplacementNamed 3'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic res = await Navigator.of(context).pushNamed(secondPage);

          print('${tag}Second page has popped');
          print(res.toString());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

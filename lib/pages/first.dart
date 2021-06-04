import 'package:flutter/material.dart';
import 'package:navigation_app/pages/second.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'First Page',
              style: TextStyle(fontSize: 50),
            ),
            TextButton(
              child: Text('Go to second'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SecondPage(data: 'Hello there from the first page!'),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:navigation_app/routes.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Second page',
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(thirdPage);
              },
              child: Text('Page 3'),
            )
          ],
        ),
      ),
    );
  }
}

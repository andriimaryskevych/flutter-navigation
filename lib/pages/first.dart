import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:navigation_app/services/navigation.dart';

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
                GetIt.I<NavigationService>().pushNamed('/second', arguments: '1');
              },
            )
          ],
        ),
      ),
    );
  }
}

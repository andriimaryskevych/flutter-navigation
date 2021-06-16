import 'package:flutter/material.dart';
import 'package:navigation_app/observer.dart';
import 'package:navigation_app/routes.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with RouteAware {
  String page = 'page2';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    super.dispose();

    routeObserver.unsubscribe(this);
  }

  @override
  void didPush() {
    super.didPush();

    print('$page didPush');
  }

  @override
  void didPushNext() {
    super.didPushNext();

    print('$page didPushNext');
  }

  @override
  void didPopNext() {
    super.didPopNext();

    print('$page didPopNext');
  }

  @override
  void didPop() {
    super.didPop();

    print('$page didPop');
  }

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

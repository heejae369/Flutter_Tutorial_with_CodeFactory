import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {

  //final String number;
  const RouteOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Route One',
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Pop'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => RouteTwoScreen(),
              ),
            );
          },
          child: Text('Move to Route Two Screen'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Move to Route Three Screen'),
        ),
      ],
    );
  }
}

/*
* 기존 코드
import 'package:flutter/material.dart';
import 'package:navigation/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  const RouteOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route One'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Pop'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => RouteTwoScreen(),
                  ),
                );
              },
              child: Text('Move to Route Two Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Move to Route Three Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

*
*/

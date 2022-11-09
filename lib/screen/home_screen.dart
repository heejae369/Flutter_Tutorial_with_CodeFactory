import 'package:flutter/material.dart';
import 'package:navigation/screen/route_one_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () async{
                //async, final await는 한 세트
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => RouteOneScreen(
                      number: 123,
                    ),
                  ),
                );
                print(result);
              },
              child: Text('Push'),
            )
          ],
        ),
      ),
    );
  }
}


/* 기존 MainLayoyt 적용전 코드
* @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => RouteOneScreen(),
                  ),
                );
              },
              child: Text('Push'),
            )
          ],
        ),
      ),
    );
  }*/
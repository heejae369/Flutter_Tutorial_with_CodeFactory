//import 'dart:js';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:navigation/screen/home_screen.dart';
import 'package:navigation/screen/route_one_screen.dart';
import 'package:navigation/screen/route_three_screen.dart';
import 'package:navigation/screen/route_two_screen.dart';

//pushNamed를 사용하는 것을 권장한다
// 단점으로 ‘/’ 링크가 달라지면 관리하기 까다로운데,
// 아래와 같이 url을 변수로 처리해서 관리하면 그때마다 수정하면 된다.
const HOME_ROUTE = '/';

void main() {
  runApp(
    MaterialApp(
      //home: HomeScreen(),
      initialRoute: '/', // 실행할 때 처음 보여줄 Route:'/' 즉 HoemScreen()
      //대표적 홈 도메안의 /이하 부분을 지정
      //www.google.com/~
      routes: {
        HOME_ROUTE : (context) => HomeScreen(),
        // '/' : (context) => HomeScreen(),
        '/one' : (context) => RouteOneScreen(),
        '/two' : (context) => RouteTwoScreen(),
        '/three' : (context) => RouteThreeScreen(),
      },
    )
  );
}

import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int? number;

  const RouteOneScreen({this.number, Key? key}) : super(key: key);
  // required 를 지움으로 number가 필수로 입력되지 않게 설정함
  //required this.number,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Route One',
      children: [
        Text(
          number.toString(),
          textAlign: TextAlign.center,
          // 텍스트 위젯은 아래 버튼들과 같이 가로 공간을 똑같이 차지함
          // 따라서 MainAxisalignment를 안했다면 가장 기본정렬은 왼쪽부터이기에
          // TextAlign을 통해 가운데로 정렬할 수 있다
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(456);

            //Navigator.of(context).pop();
            // pop안에 숫자 변수를 넣어 받는 위젯에서 async를 통해 데이터 받을 수 있다
          },
          child: Text('Pop'),
        ),
        ElevatedButton(
          onPressed: () {
            // Navigator 페이지 쌓이는 형태 : Stack, [homeScreen, RouteOne, RouteTwo] 같은 느낌
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => RouteTwoScreen(),
                // Date 전달방식 2번째, settings를 통해 전달, 받는건 RouteTwo를 통해서 참고,
                settings: RouteSettings(
                  arguments: 789,
                ),
              ),
              //MaterialPageRoute : Flutter에서 기본적으로 제공하는 기능, builder를 제공하며 라우팅하는 과정에서 안전장치로 사용됨
              //MaterialPageRoute는 앱상에서 페이지 이동할 떄 기본 애니메이션 제공함.
            );
          },
          child: Text('Push'),
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

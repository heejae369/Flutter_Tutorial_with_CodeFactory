import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    // of(context)! 의미 : 절대로 ModalRoute.of(context) 값을 못가져오는 경우가 없다.

    //ModalRoute.of(context)의 의미는 위젯트리에서 가장 가까운 ModalRoute를 가져올 수 있다
    // ModalRoute == full Screen의 Widget == RouteTwoScreen, RouteTwoScreen의 build가 실행되어있기에,
    // full Screen의 의미: build 된 Widget 즉, 하나의 화면 자체의 위젯총합

    return MainLayout(
      title: 'Route Two',
      children: [
        Text(
          'arguments : ${arguments}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          child: Text('Pop'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/three', arguments: 111111);
            // main.dart 파일에서 설정한 Route의 이름을 키값으로 가져옴
            // 즉 '/three' RouteThreeScreen()의 위젯으로 이동
            // pushNamed 안에 바로 arguments가 있어 바로 전달 가능하다
          },
          child: Text('Push Named'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              // pushReplacementNamed로 하니 엄청 짧아짐
              '/three',
            );

            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(
            //     // pushReplacement 함수설명
            //     // 결과 : RouteThreeScreen에서 Pop했을 때, RouteOneScreen으로 돌아온다.
            //     // [HomeScr, RouteOneScr, RouteTwoScr] 에서 pushreplacement
            //     // [HomeScr, RouteOneScr, RouteThreeScr]..
            //     // 3Scr 을 push 한 다음, 2Scr을 삭제
            //     // 결과적으로 RouteTwoScr가 RouteThreeScr로 함수이름처럼 대체됨
            //     builder: (_) => RouteThreeScreen(),
            //   ),
            // );
          },
          child: Text('Push Replacement'),
        ),
        ElevatedButton(
          onPressed: () {
            //pushNamedAndRemoveUntil 예시
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/three',(route) => route.settings.name == '/');
              // MaterialPageRoute 가 필요없어 코드가 간단해진다


              // Navigator.of(context).pushAndRemoveUntil(
              //   // 이전까지 Screen stack을 삭제함
              //   // 따라서 해당 함수 실행 후, pop을 한다면 아무것도 없기에 검은 화면만 출력
              //   // 좌상단 뒤로가기 버튼도 안나온다
              //   MaterialPageRoute(builder: (_) => RouteThreeScreen()),
              //       (route) => route.settings.name == '/',
              //   // stack 안에 있던 모든 Route(Screen)를 (route)로 받는다
              //   // false를 하면 삭제, true로 설정하면 다 살아있다
              //   //  특정 route만 삭제 가능
              //   //  (route) => route.settings.name == '/', 홈스크린만 뻬고 나머지 삭제
              //   // '/'만 참이기에 true여서 삭제가 안되고 나머지는 false이기에 삭제되기 때문
              //   //                (route) => route.settings.arguents == '/', 도 가능
              // );
          },
          child: Text('Push&Remove until'),
        ),
      ],
    );
  }
}

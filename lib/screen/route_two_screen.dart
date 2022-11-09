import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';

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

        ElevatedButton(onPressed: (){
          Navigator.of(context).pushNamed('/three', arguments: 111111);
          // main.dart 파일에서 설정한 Route의 이름을 키값으로 가져옴
          // 즉 '/three' RouteThreeScreen()의 위젯으로 이동
          // pushNamed 안에 바로 arguments가 있어 바로 전달 가능하다

        }, child: Text('Push Named'))
      ],
    );
  }
}

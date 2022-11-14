import 'package:flutter/material.dart';
import 'package:navigation/screen/route_one_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // async로 실행해야함 : 아마도 뒤로가기 버튼이 눌리는 이벤트가 언제들어올지 모르기때문에 async로 받는듯
        // return을 반드시 줘야함 T&F로,
        // return true : pop 가능,
        // return flase : pop 불가

        // Pop가능 할때, pop가능하게 함
        final canPop = Navigator.of(context).canPop();
        return canPop;
        // return을 T&F로 하기에 조건에 따라 원하는 bool 값 출력가능

        //return false;
        // return false로 하더라도 pop 버튼을 만들어 누르면 종료, Pop이 실행됨(pop막을 수 없다)
      },
      child: Scaffold(
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
                  print(Navigator.of(context).canPop());
                },
                child: Text('canPop'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).maybePop();
                },
                child: Text('maybePop'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Pop'),
              ),
              ElevatedButton(
                onPressed: () async {
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

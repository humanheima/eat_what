import 'package:eat_what/detail.dart';
import 'package:flutter/material.dart';
import 'index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eat what',
      initialRoute: '/', // 名为'/'路由作为应用的首页
      theme: ThemeData(
        primarySwatch: MaterialColor(
          0xFF621918,
          <int, Color>{
            50: Color(0xFF621918),
            100: Color(0xFF621918),
            200: Color(0xFF621918),
            300: Color(0xFF621918),
            400: Color(0xFF621918),
            500: Color(0xFF621918),
            600: Color(0xFF621918),
            700: Color(0xFF621918),
            800: Color(0xFF621918),
            900: Color(0xFF621918),
          },
        ),
      ),
      routes: {
        '/': (context) => IndexPage(), // 注册首页路由
        'detail': (context) {
          return DetailPage(text: ModalRoute.of(context).settings.arguments);
        }
      },
      // onGenerateRoute: (RouteSettings settings) {
      //   return MaterialPageRoute(builder: (context) {
      //     String routeName = settings.name;
      //     print('routeName $routeName');
      //     // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
      //     // 引导用户登录；其它情况则正常打开路由。
      //   });
      // },
    );
  }
}

import './model.dart';
import './detail.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  Foods _foods;
  int _personNum = 0;
  int _totalMoney = 0;
  String _showEatInfo = '';

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _showInfoWidget(),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: "人数",
                  hintText: "请输入人数",
                  prefixIcon: Icon(Icons.person)),
              onChanged: (text) {
                _personNum = int.parse(text);
              },
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "价格",
                  hintText: "请输入价格",
                  prefixIcon: Icon(Icons.attach_money)),
              onChanged: (text) {
                _totalMoney = int.parse(text);
              },
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 100,
            ),
            Offstage(
              offstage: _showEatInfo.isEmpty,
              child: Text(
                _showEatInfo,
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _getShowInfo();
          // _test();
          jump2DetailPage();
        },
        child: Icon(Icons.fastfood),
      ),
    );
  }

  void jump2DetailPage() async {
    var result =
        await Navigator.pushNamed(context, 'detail', arguments: '传递过来的参数');
    print('路由返回值: $result');
    // 非命名路由
    // var result = await Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) {
    //           return DetailPage(
    //             text: '123',
    //           );
    //         },
    //         fullscreenDialog: false));
    // print('路由返回值: $result');
  }

  void _test() async {
    try {
      String id = await login(userName: '123', pwd: 'pwd');
      String userInfo = await getUserInfo(id);
      await saveUserInfo(userInfo);
    } catch (e) {
      print(e);
    }
  }

  Future<String> login({String userName, String pwd}) {
    return Future.delayed(Duration(seconds: 2), () {
      return '123';
    });
  }

  Future<String> getUserInfo(String id) {
    return Future.delayed(Duration(seconds: 3), () {
      throw Error();
    });
  }

  Future saveUserInfo(String info) {
    return Future.delayed(Duration(seconds: 4), () {
      print('save success');
    });
  }

  Widget _showInfoWidget() {
    return TyperAnimatedTextKit(
        pause: Duration(milliseconds: 1000),
        text: ['eat what'],
        textStyle: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        displayFullTextOnTap: true,
        stopPauseOnTap: true);
  }

  void _getShowInfo() {
    _showEatInfo = '''TODO:计算规则
    人数：$_personNum
    总价：$_totalMoney
    热菜：${_foods.hot[0].name}
    凉菜：${_foods.cold[0].name}
    汤：${_foods.soup[0].name}
    ''';
    setState(() {});
  }

  void _loadData() async {
    try {
      var jsonData = await rootBundle.loadString('assets/data/eat_what.json');
      _foods = Foods.fromJson(json.decode(jsonData));
    } catch (e) {
      print(e);
    }
  }

  bool testa() => true;

  String say(String from, String msg, [String device]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
    return result;
  }
}

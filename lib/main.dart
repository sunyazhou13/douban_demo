import 'package:douban_demo/components/tabbar_Item.dart';
import 'package:douban_demo/views/group/group.dart';
import 'package:douban_demo/views/home/home.dart';
import 'package:douban_demo/views/mall/mall.dart';
import 'package:douban_demo/views/profile/profile.dart';
import 'package:douban_demo/views/subject/subject.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "sunyazhou,com",
      theme: ThemeData(
        primaryColor: Colors.green,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      home: MyStackPage(),
    );
  }
}

class MyStackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
      return MyStackPageState();
  }
}

class MyStackPageState extends State<MyStackPage> {
  var _curremtIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curremtIndex,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: [
          TabBarItem("home", "首页"),
          TabBarItem("subject", "书影音"),
          TabBarItem("group", "小组"),
          TabBarItem("mall", "市集"),
          TabBarItem("profile", "我的"),
        ],
        onTap: (int index) {
          setState(() {
            _curremtIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _curremtIndex,
        children: [
          Home(),
          Subject(),
          Group(),
          Mall(),
          Profile(),
        ],
      )
    );
  }
}
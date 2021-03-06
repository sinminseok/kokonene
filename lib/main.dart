import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main_page.dart';

void main () {
  //firebase를 사용 하기 위해선 main 메소드에 알려줘야한다.

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //StreamProvider 하단에 있는 widget 들은 value 값이 변경될때마다 감지가 가능하다.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}
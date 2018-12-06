
import 'package:flutter/material.dart';
import 'package:yysp/page/homePage.dart';
import 'package:yysp/page/aboutPage.dart';

void main()=>runApp(new RootPage());

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '鹰眼视频',
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        '/aboutPage': (BuildContext context) => new AboutPage()
      }
    );
  }
}

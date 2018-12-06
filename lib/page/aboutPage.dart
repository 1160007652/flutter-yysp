import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            appBar: AppBar(
              title: Text(
                "鹰眼视频",
                style: new TextStyle(fontSize: 20.0, letterSpacing: 3.0),
              ),
            ),
            body: Text('鹰眼视频App,娱乐无所不在！')
        )
    );
  }
}
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyNotification());
}

class MyNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:refactor_room_sharing/screens/pay.dart';
import 'package:refactor_room_sharing/screens/history.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyPay(),
        '/history': (context) => MyHistory(),
      },
    );
  }
}


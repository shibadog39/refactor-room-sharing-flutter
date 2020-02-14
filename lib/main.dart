import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refactor_room_sharing/screens/pay.dart';
import 'package:refactor_room_sharing/screens/history.dart';
import 'package:refactor_room_sharing/models/yet_item_list.dart';
import 'package:refactor_room_sharing/models/json_strings.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => YetItemList.fromJsonString(JsonStrings.listOfSampleObjects),
        child: MyApp(),
      ),
    );

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

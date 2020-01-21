import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final bottomButtons = new Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Icon(Icons.lightbulb_outline),
                new Text('Idea'),
              ],
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Icon(Icons.lightbulb_outline),
                new Text('Idea'),
              ],
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Icon(Icons.lightbulb_outline),
                new Text('Idea'),
              ],
            ),
          ),
        ],
      ),
    );

    final results = Container(
        padding: EdgeInsets.all(20),
        child: Card(
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                  decoration: new BoxDecoration(
                      border: new Border(
                          bottom: BorderSide(
                              width: 1.0, color: Color(0xFFFF000000)))),
                  children: [
                    Text('名前'),
                    Text('負担'),
                    Text('精算'),
                  ]),
              TableRow(children: [
                Text('櫻井'),
                Text('¥120'),
                Text('+ ¥60'),
              ]),
              TableRow(children: [
                Text('櫻井'),
                Text('¥0'),
                Text('- ¥60'),
              ]),
            ],
          ),
        ));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Refactor Room Sharing'),
        ),
        body: Center(
            child: Container(
          height: 600,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                child: Container(
                  child: Column(
                    children: [results],
                  ),
                ),
              ),
            ],
          ),
        )),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: bottomButtons,
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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

    final resultTable = Center(
        child: Container(
      height: 150,
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
    ));

//    Widget listItem(Color color, String title) => Container(
//          height: 50.0,
//          child: Center(
//              child: Column(
//            children: [
//              Row(
//                children: [
//
//                ],
//              )
//            ],
//          )),
//        );

    Widget listItem(Color color, String title) => Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.brown.shade800,
              child: Text('櫻井'),
            ),
            title: Text('家賃'),
            subtitle: Text('2020/1/24'),
            trailing: Text('¥170500'),
          ),
        );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: CustomScrollView(slivers: [
          _MyAppBar(),
          SliverToBoxAdapter(child: resultTable),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return listItem(Colors.green[400], "Sliver List item: $index");
            }, childCount: 20),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Pay'),
      floating: true,
      actions: [
        IconButton(
          icon: Icon(Icons.history),
          onPressed: () => null,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Container(
            decoration: new BoxDecoration(
                color: Colors.green[200],
                borderRadius: new BorderRadius.only(
                    topLeft:  const  Radius.circular(40.0),
                    topRight: const  Radius.circular(40.0))
            ),
            padding: const EdgeInsets.all(32),
            child: Center(
              child: Text(
                '¥200 もらう',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            decoration: new BoxDecoration(
                color: Colors.green[100],
                borderRadius: new BorderRadius.only(
                    bottomLeft:  const  Radius.circular(40.0),
                    bottomRight: const  Radius.circular(40.0))
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text('合計支払い額',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Row(children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('櫻井',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        Text('¥500',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text('尾花',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        Text('¥100',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );

    Widget listItem(Color color, String title) => Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.brown.shade800,
              child: Text('櫻'),
            ),
            title: Text('家賃'),
            subtitle: Text('2020/1/24'),
            trailing: Text('¥100000'),
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
          SliverToBoxAdapter(child: titleSection),
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

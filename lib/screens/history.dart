import 'package:flutter/material.dart';

class MyHistory extends StatelessWidget {
  Widget listItem(Color color, String title) =>
      Card(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        _MyHistoryBar(),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return listItem(Colors.green[400], "Sliver List item: $index");
          }, childCount: 20),
        ),
      ]),
    );
  }
}

class _MyHistoryBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('History'),
      floating: true,
    );
  }
}
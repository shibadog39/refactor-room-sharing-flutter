import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:refactor_room_sharing/screens/pay_form.dart';
import 'package:refactor_room_sharing/models/yet_item_list.dart';

class MyPay extends StatelessWidget {
  Widget resultSection = Container(
    padding: const EdgeInsets.all(32),
    child: Column(
      children: [
        Container(
          decoration: new BoxDecoration(
              color: Colors.green[200],
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0))),
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
                  bottomLeft: const Radius.circular(40.0),
                  bottomRight: const Radius.circular(40.0))),
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

  Widget buildDrawerList(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Refactor Room Sharing'),
          decoration: BoxDecoration(
            color: Colors.green[400],
          ),
        ),
        ListTile(
          title: Text('ログアウト'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    var list = Consumer<YetItemList>(
      builder: (context, itemList, child){
        List<Widget> itemCardList =
        itemList.yetItems
            .map((item) => _MyItem(item))
            .toList();
        return SliverList(
          delegate: SliverChildListDelegate(itemCardList),
        );
      },
    );

    return Scaffold(
      body: CustomScrollView(slivers: [
        _MyPayBar(),
        SliverToBoxAdapter(child: resultSection),
        list,
      ]),
      drawer: Drawer(
        child: buildDrawerList(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18.0))),
                content: PayForm(),
              );
            },
          );
        },
        tooltip: 'Add Payment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class _MyPayBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Pay'),
      floating: true,
      actions: [
        IconButton(
          icon: Icon(Icons.history),
          onPressed: () => Navigator.pushNamed(context, '/history'),
        ),
      ],
    );
  }
}

class _MyItem extends StatelessWidget {
  final dynamic item;

  _MyItem(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.brown.shade800,
          child: Text(item.userId?.toString()),
        ),
        title: Text(item.name?.toString()),
        subtitle: Text(item.date?.toString()),
        trailing: Text("¥${item.price?.toString()}"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopping/DBHelper.dart';
import 'package:shopping/models/list_item.dart';
import 'package:shopping/models/shopping_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shopping List"),
        ),
        body: ShList(),
      ),
    );
  }
}

class ShList extends StatefulWidget {
  const ShList({Key? key}) : super(key: key);

  @override
  _ShListState createState() => _ShListState();
}

class _ShListState extends State<ShList> {
  DBHelper helper = DBHelper();

  List<ShoppingList>? shopingList;

  @override
  Widget build(BuildContext context) {
    showData();
    return ListView.builder(
      itemCount: (shopingList != null) ? shopingList?.length : 0,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(shopingList![index].name),
        );
      },
    );
  }

  Future showData() async {
    await helper.openDB();
    shopingList = await helper.getLists();

    setState(() {
      shopingList = shopingList;
    });

    // ShoppingList list = ShoppingList(0, "Panaderia", 2);
    // int listId = await helper.insertList(list);

    // ListItem item = ListItem(0, listId, "pan rollito", "5 mil", "pan fresco");
    // int itemId = await helper.insertItem(item);

    // print("list ID ${listId.toString()}");
    // print("item ID ${itemId.toString()}");
  }
}

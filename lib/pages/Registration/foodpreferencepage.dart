import 'package:flutter/material.dart';

import 'components/grid_item.dart';

class FoodPreferencesPage extends StatefulWidget {
  @override
  _FoodPreferencesPageState createState() => _FoodPreferencesPageState();
}

class _FoodPreferencesPageState extends State<FoodPreferencesPage> {
  List<Item> itemList;
  List<Item> selectedList;

  @override
  void initState() {
    loadList();
    super.initState();
  }

  loadList() {
    itemList = [];
    selectedList = [];
    itemList.add(Item("assets/images/1.jpg", 1));
    itemList.add(Item("assets/images/1.jpg", 2));
    itemList.add(Item("assets/images/1.jpg", 3));
    itemList.add(Item("assets/images/1.jpg", 4));
    itemList.add(Item("assets/images/1.jpg", 5));
    itemList.add(Item("assets/images/1.jpg", 6));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: GridView.builder(
          itemCount: itemList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.56,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2),
          itemBuilder: (context, index) {
            return GridItem(
                item: itemList[index],
                isSelected: (bool value) {
                  setState(() {
                    if (value) {
                      selectedList.add(itemList[index]);
                    } else {
                      selectedList.remove(itemList[index]);
                    }
                  });
                  print("$index : $value");
                },
                key: Key(itemList[index].rank.toString()));
          }),
    );
  }

  getAppBar() {
    return AppBar(
      title: Text(selectedList.length < 1
          ? "Multi Selection"
          : "${selectedList.length} item selected"),
      actions: <Widget>[
        selectedList.length < 1
            ? Container()
            : InkWell(
                onTap: () {
                  setState(() {
                    for (int i = 0; i < selectedList.length; i++) {
                      itemList.remove(selectedList[i]);
                    }
                    selectedList = List();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.delete),
                ))
      ],
    );
  }
}

class Item {
  String imageUrl;
  int rank;

  Item(this.imageUrl, this.rank);
}

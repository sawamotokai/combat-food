import 'package:combat_food/data/explore_json.dart';
import 'package:combat_food/screens/swipe/product_detail.dart';
import 'package:combat_food/shared/list_item.dart';
import 'package:flutter/material.dart';

class LikesPage extends StatefulWidget {
  LikesPage({required this.likes});

  final List<int> likes;

  @override
  _LikesPageState createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListItem(
          index: index,
          itemList: explore_json,
          buttonText: 'Confirm',
          buttonOnPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductDetail()),
            );
          },
        );
      },
      itemCount: widget.likes.length,
    );
  }
}

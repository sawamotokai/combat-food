import 'dart:math';

import 'package:combat_food/data/explore_json.dart';
import 'package:combat_food/screens/swipe/food-details.dart';
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
          imageUrl: explore_json[index]['img'],
          title: explore_json[index]['product_name'],
          subtitle: explore_json[index]['restaurant_name'],
          buttonText: 'Confirm',
          buttonOnPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FoodDetails()),
            );
          },
        );
      },
      itemCount: widget.likes.length,
    );
  }
}

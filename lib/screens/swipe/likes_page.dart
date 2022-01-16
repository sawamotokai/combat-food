import 'dart:math';

import 'package:combat_food/data/explore_json.dart';
import 'package:combat_food/screens/swipe/food-details.dart';
import 'package:combat_food/services/api.dart';
import 'package:combat_food/shared/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class LikesPage extends StatefulWidget {
  @override
  _LikesPageState createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
  dynamic likes;

  void getLikes() async {
    Response response = await getReq('${dotenv.env["BASE_URL"]}/likes');

    print(response.body);

    setState(() {
      likes = response.body;
    });
  }

  @override
  void initState() {
    super.initState();

    getLikes();
  }

  @override
  Widget build(BuildContext context) {
    List urls = List.generate(likes.length, (index) async {
      return await getImageFromFirestore(likes[index]['imgUrl']);
    });

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListItem(
          imageUrl: urls[index],
          title: explore_json[index]['productName']!,
          subtitle: explore_json[index]['restaurantName']!,
          buttonText: 'Confirm',
          buttonOnPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FoodDetails(data: explore_json[index])),
            );
          },
        );
      },
      itemCount: likes.length,
    );
  }
}

import 'package:combat_food/services/api.dart';
import 'package:combat_food/shared/details.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:core';
import 'package:intl/intl.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    String price = data['price'].toString();
    bool dot = false;
    for (var i = 0; i < price.length; i++) {
      if (price[i] == '.') {
        price = price.substring(0, i) +
            '.' +
            price.substring(i + 1, min(2, price.length - 1));
        dot = true;
        break;
      }
    }
    if (dot == false) {
      price = price + '.00';
    }

    Widget wid = Container(
        margin: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(data['name'],
                  style: const TextStyle(fontSize: 32, letterSpacing: 1.5)),
            ),
            const Divider(),
            Row(
              children: [
                Text('Price: ', style: const TextStyle(fontSize: 20)),
                Text('\$$price',
                    style: const TextStyle(fontSize: 24, color: Colors.red)),
              ],
            ),
            Text("Ordered by: ${data['customer_fullname']}"),
            Text("Ordered at: ${data['ordered_at']}"),
            Text("Food Type: ${data['foodType']}"),
          ],
        ));
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: getImageFromFirestore(data['imageUrl']),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  children: const [
                    Text("Loading..."),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return Details(
                data: wid,
                imageUrl: snapshot.data! as String,
              );
            }
            return Text("No Error but no data");
          },
        ));
  }
}

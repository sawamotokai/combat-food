import 'package:combat_food/services/api.dart';
import 'package:combat_food/shared/details.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:core';
import 'package:intl/intl.dart';
import 'checkedout_page.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({Key? key, required this.data}) : super(key: key);
  final Map<String, String> data;

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
              child: Text(data['product_name']!,
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
            Text("By: ${data['restaurant_name']}",
                style: const TextStyle(fontSize: 24)),
            Text("Ordered at: ${data['expired_at']}"),
            Text("Food Type: ${data['foodType']}"),
          ],
        ));
    return Scaffold(
        appBar: AppBar(),
        bottomSheet: const CheckoutBottom(),
        body: FutureBuilder(
          future: getImageFromFirestore(data['imageUrl']!),
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

class CheckoutBottom extends StatelessWidget {
  const CheckoutBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Center(
        child: GestureDetector(
          onTap: () {
            // checkout
            print('Checkout!');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckedoutPage()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                )),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Text(
                'Checkout',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}

import 'package:combat_food/data/explore_json.dart';
import 'package:combat_food/shared/list_item.dart';
import 'package:flutter/material.dart';
import 'product_detail.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  List<int> orderList = [];

  @override
  void initState() {
    super.initState();

    orderList = [0, 1, 2, 3, 4];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order History',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListItem(
            index: index,
            itemList: explore_json,
            buttonText: 'Detail',
            buttonOnPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetail()),
              );
            },
          );
        },
        itemCount: orderList.length,
      ),
    );
  }
}

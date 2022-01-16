import 'package:combat_food/services/api.dart';
import 'package:combat_food/shared/details.dart';
import 'package:combat_food/shared/list_item.dart';
import 'package:flutter/material.dart';
import 'item-details.dart';

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
    orderList = [];
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
        body: Container(
            child: FutureBuilder<List<dynamic>>(
          future: getOrderHistory(),
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
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListItem(
                    // data: snapshot.data![index],
                    imageUrl: snapshot.data![index]['imageUrl'],
                    title: snapshot.data![index]['name'],
                    subtitle: snapshot.data![index]['ordered_at'],
                    buttonText: 'Details',
                    buttonOnPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ItemDetails(
                                  data: snapshot.data![index],
                                )),
                      );
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        )));
  }
}

import 'package:combat_food/data/explore_json.dart';
import 'package:combat_food/shared/list_item.dart';
import 'package:flutter/material.dart';

class PostedItems extends StatefulWidget {
  const PostedItems({Key? key}) : super(key: key);

  @override
  _PostedItemsState createState() => _PostedItemsState();
}

class _PostedItemsState extends State<PostedItems> {
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
          'Posted Items',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListItem(
            data: explore_json[index],
            buttonText: 'Delete',
            buttonOnPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    color: Colors.amber,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text(
                            'Are you sure to delete your posted item?',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ElevatedButton(
                            child: const Text(
                              'Delete Item',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        itemCount: orderList.length,
      ),
    );
  }
}

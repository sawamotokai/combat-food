import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    required this.index,
    required this.itemList,
    required this.buttonText,
    required this.navigatedPage,
  });

  final int index;
  final List<dynamic> itemList;
  final String buttonText;
  final Widget navigatedPage;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(itemList[index]['img']),
        ),
        title: Text(itemList[index]['product_name']),
        subtitle: Text(itemList[index]['restaurant_name']),
        trailing: Container(
          width: 80,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.shade300,
          ),
          child: GestureDetector(
            onTap: () {
              // TODO: goto
              print('Confirm!');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => navigatedPage),
              );
            },
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

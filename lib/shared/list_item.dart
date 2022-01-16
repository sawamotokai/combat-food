import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    required this.data,
    required this.buttonText,
    required this.buttonOnPressed,
  });

  final dynamic data;
  final String buttonText;
  final VoidCallback buttonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(data['img']),
        ),
        title: Text(data['product_name']),
        subtitle: Text(data['restaurant_name']),
        trailing: Container(
          width: 80,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.shade300,
          ),
          child: GestureDetector(
            onTap: buttonOnPressed,
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

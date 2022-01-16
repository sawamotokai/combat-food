import 'package:combat_food/screens/swipe/setting_screen/food_type/food_type_check_list.dart';
import 'package:flutter/material.dart';

class FoodTypeField extends StatelessWidget {
  final List<String> _foodTypes = [
    'Japanese',
    'Chinese',
    'Italian',
    'Fruit',
  ];
  final int size = 4;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 0.75),
            ),
          ],
        ),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: const Text(
                'Food type',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            FoodTypeCkeckList(foodTypes: _foodTypes, size: size),
          ],
        ),
      ),
    );
  }
}

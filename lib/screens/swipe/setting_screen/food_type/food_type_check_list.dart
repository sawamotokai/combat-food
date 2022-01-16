import 'package:flutter/material.dart';
import 'food_type_check.dart';

// ignore: must_be_immutable
class FoodTypeCkeckList extends StatelessWidget {
  final List<String> foodTypes;
  final int size;
  // ignore: use_key_in_widget_constructors
  FoodTypeCkeckList({required this.foodTypes, required this.size});

  // ignore: prefer_function_declarations_over_variables
  Function onPressed = () => {};
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 15, left: 40, right: 40),
        decoration: BoxDecoration(
          color: Colors.orange[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: SingleChildScrollView(
          child: Container(
            child: ListView(
              shrinkWrap: true,
              children: List<FoodType>.generate(
                size,
                (index) => FoodType(foodTypes[index], onPressed),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}

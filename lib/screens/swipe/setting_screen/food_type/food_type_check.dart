import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class FoodType extends StatefulWidget {
  final String itemType;
  final Function onPressed;
  // ignore: use_key_in_widget_constructors
  const FoodType(this.itemType, this.onPressed);

  @override
  State<StatefulWidget> createState() => _FoodTypeCheck();
}

class _FoodTypeCheck extends State<FoodType> {
  // ignore: use_key_in_widget_constructors

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.itemType,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
      value: timeDilation != 0.1,
      onChanged: (bool? value) {
        setState(() {
          timeDilation = value! ? 1.0 : 0.1;
        });
      },
    );
  }
}

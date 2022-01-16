import 'package:flutter/material.dart';
import 'distance_set.dart';

// ignore: use_key_in_widget_constructors
class DistanceField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 2,
              blurRadius: 15,
              offset: Offset(0, 0.75),
            ),
          ],
        ),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10),
              width: double.infinity,
              child: const Text(
                'Distance',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            const DistanceSet(),
          ],
        ),
      ),
    );
  }
}

import 'apply_button.dart';
import 'package:flutter/material.dart';

class ApplyButtonField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function onPressed = () => {};
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        child: ApplyButton(onPressed),
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
      ),
    );
  }
}

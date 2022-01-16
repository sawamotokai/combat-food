import 'apply_button.dart';
import 'package:flutter/material.dart';

class ApplyButtonField extends StatelessWidget {
  Function _onPressed = () {};
  ApplyButtonField(Function onPressed, {Key? key}) : super(key: key) {
    _onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        child: ApplyButton(_onPressed),
        decoration: BoxDecoration(
          // color: Colors.white70,
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

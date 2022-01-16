import 'package:flutter/material.dart';

class ApplyButton extends StatefulWidget {
  final Function onPressed;
  const ApplyButton(this.onPressed);

  @override
  State<StatefulWidget> createState() => _Apply();
}

class _Apply extends State<ApplyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: ElevatedButton(
          onPressed:() => widget.onPressed,
          child:Text(
            'APPLY',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      color: Colors.lightGreenAccent,
      child: const Center(
        child: Text(
          'Detail',
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}

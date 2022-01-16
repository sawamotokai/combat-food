import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomIcon extends StatelessWidget {
  BottomIcon({
    required this.assetName,
    required this.height,
    required this.width,
  });

  final String assetName;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
          )
        ],
      ),
      child: Center(
        child: SvgPicture.asset(
          assetName,
          height: height,
          width: width,
        ),
      ),
    );
  }
}

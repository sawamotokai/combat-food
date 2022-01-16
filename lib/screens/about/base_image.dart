import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Text(
            '\nOur Approach',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center, 
          ),
          Text(
            '\nWe build a bridge between stores and customers: customers can efficiently sort and find their food at lower cost, while stores can offer almost expiring food at their wishing price.\n',
            style: GoogleFonts.taviraj(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      // constraints: BoxConstraints.expand(),
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: Image.network(
                    'https://cdn.pixabay.com/photo/2020/04/13/10/48/coffee-5037804_1280.jpg')
                .image
            // fit: BoxFit.cover,
            ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = ' \nCOMBAT FOOD IS DESIGNED MINIMIZE THE AMOUNT OF' +
        ' FOOD WASTE BY CONNECTING STORES AND INDIVIDUALS.\n';
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.brown.shade300,
        ),
        width: double.infinity,
        // height: 120,
        child: Text(
          text,
          style: GoogleFonts.taviraj(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

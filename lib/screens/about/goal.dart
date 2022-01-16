import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Goal extends StatelessWidget {
  const Goal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text =
        ' \nOUR GOAL\n\nOur goal is to minimize food waste while stores can still make some money and customers can get the food at lower price. To achieve sustainable and environmental friendly society, we beleive this will be a some progress to all of us.\n';
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.brown.shade100,
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

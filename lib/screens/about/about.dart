import 'dart:ui';

import 'package:combat_food/screens/about/base_image.dart';
import 'package:combat_food/screens/about/goal.dart';
import 'package:combat_food/screens/about/message.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Combat food",
            style: GoogleFonts.pacifico(),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Column(
              children: [
                Text('ABOUT US', textAlign: TextAlign.left, style: GoogleFonts.pacifico(),),
                Message(),
                BaseLayout(),
                Goal(),
              ],
            ),
          ),
        ));
  }
}

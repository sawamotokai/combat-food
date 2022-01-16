import 'package:combat_food/screens/swipe/swipe.dart';
import 'package:flutter/material.dart';

class CheckedoutPage extends StatelessWidget {
  const CheckedoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Thank you for checking out!!!\nEnjoy the food!',
                style: TextStyle(
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SwipeScreen(),
                      ),
                      (dynamic) => false);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Back to Swipe',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

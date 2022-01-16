import 'package:combat_food/shared/details.dart';
import 'package:flutter/material.dart';

import 'checkedout_page.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({Key? key}) : super(key: key);

  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  @override
  Widget build(BuildContext context) {
    List<Widget> data = [];

    return Scaffold(
      appBar: AppBar(),
      body: Details(
          imageUrl:
              'https://images.unsplash.com/photo-1587410131477-f01b22c59e1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dGFsbCUyMHRvd2VyfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
          data: data),
      bottomSheet: const CheckoutBottom(),
    );
  }
}

class CheckoutBottom extends StatelessWidget {
  const CheckoutBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Center(
        child: GestureDetector(
          onTap: () {
            // checkout
            print('Checkout!');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckedoutPage()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                )),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Text(
                'Checkout',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}

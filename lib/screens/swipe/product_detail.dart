import 'package:combat_food/shared/detail_body.dart';
import 'package:flutter/material.dart';

import 'checkedout_page.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: DetailBody(
        size: size,
      ),
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

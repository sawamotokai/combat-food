import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.data,
    required this.imageUrl,
  }) : super(key: key);

  final Widget data;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
          ),
          data
          // ListView.builder(itemBuilder: )
        ],
      ),
    );
  }
}

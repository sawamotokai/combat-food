import 'package:combat_food/shared/details.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({Key? key, required this.data}) : super(key: key);
  final Map<String, String> data;

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    List<Widget> data = [];

    return Scaffold(
      appBar: AppBar(),
      body: Details(
        imageUrl:
            'https://images.unsplash.com/photo-1587410131477-f01b22c59e1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dGFsbCUyMHRvd2VyfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        data: data,
      ),
    );
  }
}

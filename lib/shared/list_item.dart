import 'package:combat_food/services/api.dart';
import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  // const ListItem({Key? key}) : super(key: key);
  final String imageUrl;
  final String buttonText;
  final VoidCallback buttonOnPressed;
  final String title;
  final String subtitle;

  const ListItem({
    Key? key,
    required this.imageUrl,
    required this.buttonText,
    required this.buttonOnPressed,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  String _url = "";

  Future<void> _getUrl() async {
    _url = await getImageFromFirestore(widget.imageUrl);
  }

  @override
  void initState() {
    // _getUrl();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(widget.imageUrl),
        ),
        title: Text(widget.title),
        subtitle: Text(widget.subtitle),
        trailing: Container(
          width: 80,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.shade300,
          ),
          child: GestureDetector(
            onTap: widget.buttonOnPressed,
            child: Text(
              widget.buttonText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

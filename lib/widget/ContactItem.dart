import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  ContactItem(
      {Key? key,
      required this.count,
      required this.title,
      required this.onPressed})
      : super(key: key);
  final String count;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 4.0,
            ),
            child: Text(count, style: TextStyle(fontSize: 18.0)),
          ),
          Text(title, style: TextStyle(color: Colors.black54, fontSize: 14.0)),
        ],
      ),
    );
  }
}

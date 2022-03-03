// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({Key? key, required this.title, required this.body})
      : super(key: key);

  final title;
  final body;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            body,
            style: const TextStyle(fontSize: 14),
          )
        ]),
      ),
    );
  }
}

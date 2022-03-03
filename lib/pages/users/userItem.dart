// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../Posts/post.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    Key? key,
    required this.username,
    required this.id,
    required this.email,
  }) : super(key: key);

  final username;
  final id;
  final email;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostPage(title: username, userId: id)));
      },
      title: Text(username),
      subtitle: Text(email),
    );
  }
}

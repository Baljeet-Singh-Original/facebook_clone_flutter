// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../../network/api_service.dart';
import '../../network/response/post_response.dart';
import 'package:dio/dio.dart' as dio;

import 'PostItem.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key, required this.title, required this.userId})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final int userId;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<PostResponse>? posts;

  Future<void> getUserPosts() async {
    ApiService apiService = ApiService(dio.Dio());
    final response = await apiService.userPosts(widget.userId);
    setState(() {
      posts = response;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserPosts();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: posts != null
          ? (posts!.isNotEmpty
              ? (SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: posts!.map((post) {
                      return InkWell(
                        onTap: () {
                          print(post.userId);
                        },
                        child: PostItem(
                          title: post.title,
                          body: post.body,
                        ),
                      );
                    }).toList(),
                  ),
                ))
              : const Center(child: (Text('No Posts Found.'))))
          : const Center(child: (CircularProgressIndicator())),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              posts = null;
            });
            getUserPosts();
          },
          child: const Icon(Icons
              .refresh)), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

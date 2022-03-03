import 'package:flutter/material.dart';

import '../../network/api_service.dart';
import '../../network/response/user_response.dart';
import 'package:dio/dio.dart' as dio;

import 'userItem.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<UserResponse>? profiles;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Future<void> getUserProfiles() async {
    WidgetsBinding.instance?.addPostFrameCallback((Duration duration) {
      _refreshIndicatorKey.currentState?.show();
    });

    ApiService apiService = ApiService(dio.Dio());
    final response = await apiService.userProfiles();
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      profiles = response;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserProfiles();
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
      body: RefreshIndicator(
        onRefresh: () async {
          await getUserProfiles();
        },
        key: _refreshIndicatorKey,
        child: (ListView(
          children: [
            profiles != null
                ? (profiles!.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: profiles!.map((profile) {
                          return UserItem(
                              id: profile.id,
                              email: profile.email,
                              username: profile.username);
                          // return ProfileItem(profile: profile);
                        }).toList(),
                      )
                    : const Center(child: (Text('No Profiles Found.'))))
                : Container()
          ],
        )),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

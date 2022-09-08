import 'dart:async';

import 'package:bisharat_tasks/screens/login.dart';
import 'package:bisharat_tasks/statemanagement/provider/provider.dart';
import 'package:bisharat_tasks/utils/api_allposts.dart';
import 'package:bisharat_tasks/utils/api_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Userinfo()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color(0xffE43228),
          primaryColorDark: Color(0xffAF0917)),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ApiPosts posts = ApiPosts();
  ApiProfile profile_api = ApiProfile();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    posts.getPosts();
    profile_api.getProfile();
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LogIn())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(child: Image.asset('assets/logo.jpeg')),
      ),
    );
  }
}

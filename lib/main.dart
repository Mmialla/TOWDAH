import 'package:flutter/material.dart';
import 'package:towdah/pages/LoginForm.dart';
import 'package:towdah/pages/favourite.dart';
import 'package:towdah/pages/home.dart';
import 'package:towdah/pages/playlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => Home(),
        '/':(context) => LoginForm(),
        '/fav': (context) => Fav(),
        '/playlist': (context) => Playlist(),

      },
    );
  }
}

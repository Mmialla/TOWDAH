import 'package:flutter/material.dart';
import 'package:towdah/pages/favourite.dart';
import 'package:towdah/pages/home.dart';
import 'package:towdah/pages/playlist.dart';
import 'package:towdah/pages/artist.dart';
import 'package:towdah/pages/artist01.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        '/fav': (context) => Fav(),
        '/playlist': (context) => Playlist(),
        '/artist' : (context) => Artist(),
        "/artist 01" : (context) => Artist01(),
      },
    );
  }
}

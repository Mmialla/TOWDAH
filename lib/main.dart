import 'package:flutter/material.dart';
import 'package:towdah/pages/favourite.dart';
import 'package:towdah/pages/home.dart';
import 'package:towdah/pages/playlist.dart';
import 'package:towdah/pages/player.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/p': (context) => Home(),
        '/fav': (context) => Fav(),
        '/': (context) => Playlist(),
        '/player': (context) => MusicPlayerScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:towdah/pages/favourite.dart';
import 'package:towdah/pages/home.dart';
import 'package:towdah/pages/playlist.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'Login/LoginForm.dart';

void main() {
  runApp(MaterialApp(
    title:'Login',
    home:Login(),
  ));

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        '/fav': (context) => Fav(),
        '/playlist': (context) => Playlist()
      },
    );
  }
}
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTittle="Login" ;
    return MaterialApp(
      title:appTittle,
      home: Scaffold(
        appBar:AppBar(
          title:Text(appTittle)  ,
        ) ,
        backgroundColor: Colors.blueGrey,
        body: LoginForm(),
      ),
    );
  }
}



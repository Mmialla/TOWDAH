import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FontAwesomeIcons;
import 'package:towdah/pages/player.dart';

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Towdah",
      theme:ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MusicPlayerScreen(),
    );
  }

}


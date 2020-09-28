import 'package:flutter/material.dart';
import 'package:towdah/pages/playlist.dart';

import 'package:towdah/pages/favourite.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {

      '/' :(context) => Playlist(),
      '/fav' : (context) => Fav(),

    },
    // theme: ThemeData.dark(),
  ));
}
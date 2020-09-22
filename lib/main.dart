import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home()
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TOWDAH'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(


          ),


      floatingActionButton:FloatingActionButton(
        child: Text('click'),
        onPressed:(){},
      ) ,
    );
  }
}


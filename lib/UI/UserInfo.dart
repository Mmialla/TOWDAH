import 'package:flutter/material.dart';

class UserInput extends StatelessWidget{

  String hintT;
  UserInput(this.hintT);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 300,
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.teal,
        child: TextField(
          decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              border: InputBorder.none,
              hintText: hintT,
              fillColor: Colors.teal,
              filled: true

          ),
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.black
          ),
        ),
      ),
    );
  }


}


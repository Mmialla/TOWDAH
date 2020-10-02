import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MusicPlayerScreen extends StatefulWidget {
  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {

  bool isPlaying=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),

              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 10),
                child: IconButton(
                  onPressed: (){},
                  icon: Icon(FontAwesomeIcons.chevronDown),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal,
                      offset: Offset(0, 10),
                      spreadRadius: 0,
                      blurRadius: 30,
                    ),

                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: NetworkImage("https://www.pexels.com/photo/turned-on-black-samsung-smartphone-between-headphones-1337753/"),
                    width: MediaQuery.of(context).size.width-0.7,
                    height: MediaQuery.of(context).size.width-0.7,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                  "Music Name",
                  style: TextStyle(
                    fontSize: 20,
                  )
              ),
              Text("Artist Name"),
              SizedBox(height: 20,),
              Slider(
                onChanged: (v){},
                value: 10,
                max: 100,
                min: 0,
                activeColor: Colors.teal,
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    onPressed: (){},
                    icon: Icon(FontAwesomeIcons.backward),

                  ),
                  IconButton(
                    iconSize: 50,
                    onPressed: (){
                      setState(() {
                        isPlaying=!isPlaying;
                      });
                    },
                    icon: Icon(
                      isPlaying?FontAwesomeIcons.pause:FontAwesomeIcons.play,
                      color: Colors.teal,),

                  ), IconButton(
                    onPressed: (){},
                    icon: Icon(FontAwesomeIcons.forward),

                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_player/music_player.dart';

class MusicPlayerScreen extends StatefulWidget {
  final String artist;
  final String title;
  final String url;

  MusicPlayerScreen({this.title, this.artist, this.url});

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  MusicPlayer musicPlayer;

  @override
  void initState() {
    super.initState();
    
    initPlatformState();
  }

  // initPlatformState() {
  //   musicPlayer = MusicPlayer();
  // }
  Future<void> initPlatformState() async {
    musicPlayer = MusicPlayer();
  }

  bool isPlaying = false;
  Duration duration ;
  Duration endTime ;

  RangeValues values = RangeValues(0.0, 10.0);

  
  

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
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.chevronDown),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
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
                    image: NetworkImage(
                        "https://www.pexels.com/photo/turned-on-black-samsung-smartphone-between-headphones-1337753/"),
                    width: MediaQuery.of(context).size.width - 0.7,
                    height: MediaQuery.of(context).size.width - 0.7,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(widget.title,
                  style: TextStyle(
                    fontSize: 20,
                  )),
              Text(widget.artist),
              SizedBox(
                height: 20,
              ),
              Slider(
                onChanged: (values) {},
                value: 10,
                max: 100,
                min: 0,
                activeColor: Colors.teal,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      musicPlayer.onPlayPrevious();
                    },
                    icon: Icon(Icons.skip_previous, size:40.0,),
                  ),
                  IconButton(
                    iconSize: 50,
                    onPressed: () {
                      if (isPlaying) {
                        setState(() {
                          isPlaying = false;
                        });
                        musicPlayer.play(
                          MusicItem(
                            trackName: widget.title == null ? '' : widget.title,
                            albumName: '',
                            artistName:
                                widget.artist == null ? '' : widget.artist,
                            url: widget.url == null ? '' : widget.url,
                            //coverUrl: widget.image_url==null?'':widget.image_url,
                           duration: Duration(seconds: 255 ),
                          ),
                        );
                      } else {
                        musicPlayer.stop();
                        setState(() {
                          isPlaying = true;
                        });
                      }
                    },
                    icon: Icon(
                      isPlaying
                          ? FontAwesomeIcons.play
                          : FontAwesomeIcons.pause,
                      color: Colors.teal,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      musicPlayer.onPlayNext(setState((){}));
                    },
                    icon: Icon(Icons.skip_next, size: 40.0,),
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

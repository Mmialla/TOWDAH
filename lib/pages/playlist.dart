import 'package:flutter/material.dart';
import 'package:towdah/pages/LoginForm.dart';
import 'package:towdah/pages/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:towdah/pages/popupmenu.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
bool _success;

class Playlist extends StatefulWidget {
  @override
  _PlaylistState createState() => new _PlaylistState();
}

class _PlaylistState extends State<Playlist> {

  var firebaseDb = FirebaseFirestore.instance.collection("songs").snapshots();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        PopupMenuButton<String>(
          onSelected: choiceAction,
          itemBuilder: (BuildContext context){
            return Constants.choices.map((String choice){
              return PopupMenuItem<String>(
                  value:choice ,
                  child: Text(choice),
              );

            }).toList();
          },
          )
        ],
        backgroundColor: Colors.teal,
        title: Text('Towdah'),
        centerTitle: false,
      ),
      backgroundColor: Colors.blueGrey[100],
      // body: HomeP(),
      body: StreamBuilder(
          stream: firebaseDb,
          builder: (context, snapshot) {
            if (!snapshot.hasData) 
            return CircularProgressIndicator();
            
              
            return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, int index) {
                    return Card(
                        elevation:0.0,
                        color: Colors.white,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.teal,
                            child: Icon(Icons.audiotrack, size: 14.0),
                            radius: 14.0,
                          ),
                          trailing: Text('...'),
                          title: Text(snapshot.data.docs[index]['songName']),
                          subtitle:
                              Text(snapshot.data.docs[index]['artistName']),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MusicPlayerScreen(
                                          title: snapshot.data.docs[index]
                                              ["songName"],
                                          artist: snapshot.data.docs[index]
                                              ["artistName"],
                                          url: snapshot.data.docs[index]
                                              ["songUrl"],
                                        )));
                          },
                        ));
                  });
            }
          ),

      bottomNavigationBar: BottomAppBar(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.skip_previous,
                color: Colors.teal,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow,
                color: Colors.teal,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.skip_next,
                color: Colors.teal,
              )),
        ]),
      ),
    );
  }

  //choose action on the popupmenu
  void choiceAction(String choice) {
    if (choice == Constants.settings){

    }
    if (choice == Constants.sign_out){
      signOutGoogle();
      signOut() ;
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginForm();}), ModalRoute.withName('/'));

    }
    if (choice == Constants.subscribe){

    }
  }

  // sign out with google
  Future <void> signOutGoogle() async{
    await googleSignIn.signOut();

    print("User Signed Out");
  }
  signOut() async {
    await _auth.signOut();
  }
}


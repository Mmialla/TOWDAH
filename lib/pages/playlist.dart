import 'package:flutter/material.dart';
import 'package:towdah/pages/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomPopupMenu {
  CustomPopupMenu({
    this.title,
    this.icon,
  });
  String title;
  IconData icon;
}

List<CustomPopupMenu> choices = <CustomPopupMenu>[
  CustomPopupMenu(title: 'Share', icon: Icons.share),
  CustomPopupMenu(title: 'Settings', icon: Icons.settings),
  CustomPopupMenu(title: 'Log-out', icon: Icons.account_circle),
];

class Playlist extends StatefulWidget {
  @override
  _PlaylistState createState() => new _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  CustomPopupMenu _selectedChoices = choices[0];
  void _select(CustomPopupMenu choice) {
    setState(() {
      _selectedChoices = choice;
    });
  }

  var firebaseDb = FirebaseFirestore.instance.collection("songs").snapshots();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopupMenuButton(
            elevation: 3.2,
            initialValue: choices[1],
            onCanceled: () {
              print('You have not chossed anything');
            },
            tooltip: 'This is tooltip',
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((CustomPopupMenu choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice.title),
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
                      elevation: 10.8,
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
}

class SelectedOption extends StatelessWidget {
  CustomPopupMenu choice;
  SelectedOption({Key key, this.choice}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(choice.icon, size: 140.0, color: Colors.white),
            Text(
              choice.title,
              style: TextStyle(color: Colors.white, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}

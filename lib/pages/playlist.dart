import 'package:flutter/material.dart';
import 'package:towdah/pages/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Playlist extends StatefulWidget {
  @override
  _PlaylistState createState() => new _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  var firebaseDb = FirebaseFirestore.instance.collection('songs').snapshots();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){}),
          IconButton(icon: Icon(Icons.share), onPressed: (){}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){})
        ],
        backgroundColor: Colors.teal,
        title: Text('Towdah'),
        centerTitle: false,
      ),
      backgroundColor: Colors.blueGrey[100],
     // body: HomeP(),
     body:StreamBuilder(
       stream: firebaseDb,
       builder: (context,  snapshot){
         if(!snapshot.hasData){
           return CircularProgressIndicator();
         }
         else{
     return ListView.builder(
        itemCount: snapshot.data.docs.length,
         itemBuilder:( context, int index)
         {
           return Card(
               elevation: 0,
               color: Colors.white,
               child: ListTile(
                 leading: CircleAvatar(
                   backgroundColor: Colors.teal,
                   child:  Icon(Icons.audiotrack, size: 14.0),
                   radius: 14.0,
                 ),
                 trailing: Text('...'),
                 title: Text(snapshot.data.docs[index]['song_name']), 
                 subtitle: Text(snapshot.data.docs[index]['artist_name']),
                 onTap: (){Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MusicPlayerScreen(
                              title:snapshot.data.docs[index]["song_name"],
                              artist:snapshot.data.docs[index]["artist_name"],
                              url:snapshot.data.docs[index]["song_url"],
                             
                            )));
                   
                 },
               )

           );
         });
         }
       }),

      bottomNavigationBar: BottomAppBar(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: (){},icon: Icon(Icons.skip_previous,  color: Colors.teal,)),
              IconButton(onPressed: (){},icon: Icon(Icons.play_arrow, color: Colors.teal,)),
              IconButton(onPressed: (){},icon: Icon(Icons.skip_next, color: Colors.teal,)),
            ]),
      ),



    
    );
  }
}



import 'package:flutter/material.dart';
import 'package:towdah/pages/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Playlist extends StatefulWidget {
  @override
  _PlaylistState createState() => new _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
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
      body: HomeP(),
//      body: ListView.builder(
//          itemBuilder:(BuildContext context, int index)
//          {
//            return Card(
//                elevation: 0,
//                color: Colors.white,
//                child: ListTile(
//                  leading: CircleAvatar(
//                    backgroundColor: Colors.teal,
//                    child:  Icon(Icons.audiotrack, size: 14.0),
//                    radius: 14.0,
//                  ),
//                  trailing: Text('...'),
//                  title: Text('song'),
//                  subtitle: Text('artist'),
//                  onTap: (){},
//                )
//
//            );
//          }),
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
class HomeP extends StatefulWidget {
  @override
  _HomePState createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
  Future getdata() async {
    QuerySnapshot qn =
    await Firestore.instance.collection('songs').getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MusicPlayerScreen(
                              title:snapshot.data[index].data["song_name"],
                              artist:snapshot.data[index].data["artist_name"],
                              url:snapshot.data[index].data["song_url"],
                              //image:snapshot.data[index].data["image_url"]
                            ))),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        snapshot.data[index].data["song_name"],
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),),),
                  elevation: 10.0,
                );},
            );}
        });
  }
}


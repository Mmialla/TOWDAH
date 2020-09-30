import 'package:flutter/material.dart';
class Fav extends StatefulWidget {
  @override
  _FavState createState() => new _FavState();
}

class _FavState extends State<Fav> {
  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){}),
          IconButton(icon: Icon(Icons.share), onPressed: (){}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){})
        ],
        backgroundColor: Colors.teal,
        title: Text('Favorites'),
        centerTitle: false,
      ),
      backgroundColor: Colors.blueGrey[100],
      body: ListView.builder(
          itemBuilder:(BuildContext context, int index)
          {
            return Card(
                elevation: 0,
                color: Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,

                    child: Icon(Icons.favorite, size: 14.0,),
                    radius: 14.0,
                  ),
                  trailing: Text('...'),
                  title: Text('song'),
                  subtitle: Text('artist'),
                  onTap: (){},
                )

            );
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
